import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../flutter_extension.dart';
import 'jd_exception.dart';

import '../jd_log.dart';
import '../loading_util.dart';

enum JDRequestMethod {
  get,
  post, // 默认 json 格式
  postWithFormData,
}

typedef OnRequestStart = Function(String requestTag);
typedef OnRequestSuccess = Function(String requestTag);
typedef OnRequestFail = Function(
    String requestTag, Object exception, StackTrace stackTrace);

class JDRequestModel {
  final String code;
  final String msg;
  final dynamic data;

  JDRequestModel(this.code, this.msg, this.data);
}

@immutable
class JDRequestListener {
  /// 请求开始
  final OnRequestStart? onRequestStart;

  /// 请求成功
  final OnRequestSuccess? onRequestSuccess;

  /// 请求失败
  final OnRequestFail? onRequestFail;

  /// [toString]输出的文字
  final String? toStringText;

  const JDRequestListener(
      {this.onRequestStart,
      this.onRequestSuccess,
      this.onRequestFail,
      this.toStringText});

  @override
  String toString() => toStringText ?? super.toString();
}

typedef HookApiServiceHeaders = Map<String, dynamic> Function();

class JDApiRequest {
  static HookApiServiceHeaders? httpHeaders;
  static late String apiServiceUrl;

  final String _url;
  final JDRequestMethod _method;
  Map<String, dynamic>? requestParams;

  // 超时时间
  int? timeOutSecond;

  bool _needToast = false;
  bool _needFilterRequest = true;
  String? _requestTag;
  CancelToken? _cancelToken;
  JDRequestListener? _loadListener;

  /// 请求工具
  JDApiRequest._(this._method, this._url);

  /// GET 请求
  factory JDApiRequest.get(String url) =>
      JDApiRequest._(JDRequestMethod.get, url);

  /// POST 请求
  factory JDApiRequest.post(String url) =>
      JDApiRequest._(JDRequestMethod.post, url);

  /// POST 请求 通过 表单
  factory JDApiRequest.postFormData(String url) =>
      JDApiRequest._(JDRequestMethod.postWithFormData, url);

  /// 携带的参数
  JDApiRequest params(Map<String, dynamic>? params) {
    try {
      requestParams = params;
    } catch (error) {
      TDToast.showDebug('赋值失败($_url),请检查log');
    }
    return this;
  }

  /// 指定的请求[tag] 等于空串时不输出请求日志
  /// 需配合[needFilterRequest]一起使用
  JDApiRequest tag(String tag) {
    _requestTag = tag;
    return this;
  }

  JDApiRequest setTimeOut(int time) {
    timeOutSecond = time;
    return this;
  }

  /// 请求失败时是否通过toast提示
  JDApiRequest needToastError(bool need) {
    _needToast = need;
    return this;
  }

  /// 需要过滤请求,默认true,设置为false不参与过滤
  JDApiRequest needFilterRequest(bool need) {
    _needFilterRequest = need;
    return this;
  }

  /// 设置加载回调
  JDApiRequest loadListener(JDRequestListener? loadListener) {
    _loadListener = loadListener;
    return this;
  }

  JDApiRequest needLoading(bool needLoading) {
    if (needLoading) {
      _loadListener = JDApiRequest.defaultListener;
    }
    return this;
  }

  /// 设置取消的token
  JDApiRequest cancelToken(CancelToken? cancelToken) {
    _cancelToken = cancelToken;
    return this;
  }

  /// 发起请求
  Future<Map<String, dynamic>> get request => _startRequest(this);

  /// 生成请求Tag
  static String _generateRequestTag(JDApiRequest request) {
    final requestTime = DateTime.now().millisecondsSinceEpoch / 1000;
    if (request._method == JDRequestMethod.get) {
      return json.encode({
        'method': 'GET',
        'url': request._url,
        'params': request.requestParams,
        'requestTime': requestTime
      });
    } else if (request._method == JDRequestMethod.post) {
      return json.encode({
        'method': 'POST',
        'url': request._url,
        'params': request.requestParams,
        'requestTime': requestTime
      });
    } else if (request._method == JDRequestMethod.postWithFormData) {
      return json.encode({
        'method': 'POST_WITH_FORM_DATA',
        'url': request._url,
        'params': null,
        'requestTime': requestTime
      });
    }
    return request.hashCode.toString();
  }

  /// 生成请求路径
  static String _generateRequestUrl(JDApiRequest request) {
    if (request._url.startsWith(r'http://') == true ||
        request._url.startsWith(r'https://') == true) {
      return request._url;
    } else {
      return "${JDApiRequest.apiServiceUrl}${request._url}";
    }
  }

  /// 生成请求配置
  static Options _generateRequestOption(JDApiRequest request) {
    JDRequestMethod method = request._method;
    String contentType;
    if (JDRequestMethod.get == method || JDRequestMethod.post == method) {
      contentType = ContentType.json.toString();
    } else if (JDRequestMethod.postWithFormData == method) {
      contentType = ContentType('multipart', 'form-data').toString();
    } else {
      contentType = ContentType.binary.toString();
    }
    int timeOut = request.timeOutSecond ?? 7;
    Options options =
        Options(method: JDRequestMethod.get == method ? "GET" : "POST")
          ..headers = {
            ...?httpHeaders?.call(),
            HttpHeaders.acceptHeader: '*/*',
            HttpHeaders.contentTypeHeader: contentType,
          }
          ..sendTimeout = Duration(seconds: timeOut)
          ..receiveTimeout = Duration(seconds: timeOut);
    return options;
  }

  static get defaultListener {
    return JDRequestListener(
      onRequestStart: (String requestTag) {
        return JDLoadingTool.showLoading(tag: requestTag);
      },
      onRequestSuccess: (String requestTag) {
        return JDLoadingTool.dismissLoading(tag: requestTag);
      },
      onRequestFail:
          (String requestTag, Object exception, StackTrace stackTrace) {
        return JDLoadingTool.dismissLoading(tag: requestTag);
      },
      toStringText: 'defaultListener',
    );
  }
}

final Set<String?> _requestingList = {};

class TDDioInstance {
  Dio dio = Dio();
  factory TDDioInstance() => _instance;
  static final TDDioInstance _instance = TDDioInstance._internal();
  TDDioInstance._internal();
}

/// 开始请求
Future<Map<String, dynamic>> _startRequest(JDApiRequest request) async {
  final requestTag =
      request._requestTag ?? JDApiRequest._generateRequestTag(request);
  if (_requestingList.contains(requestTag) && request._needFilterRequest) {
    jdLog("重复请求中($request)..");
  }
  final startTime = DateTime.now();
  try {
    _requestingList.add(requestTag);
    _runZonedIfNotNull(request._loadListener?.onRequestStart?.call(requestTag));
    final resp = await _requestInner(request, requestTag);
    _runZonedIfNotNull(
        request._loadListener?.onRequestSuccess?.call(requestTag));
    jdLog("请求成功结束----->  ${request._url} $resp");
    if (!resp.responseSucceed()) {
      if (request._needToast) {
        TDToast.showToast(resp.getStringNotNull(TDResponseConstant.message));
      }
    }
    return Future.value(resp);
  } catch (exception, stackTrace) {
    String errorMsg = '';
    int errorCode = 0;
    if (exception is JDApiException) {
      errorMsg = exception.msg;
      errorCode = exception.code;
      jdLog(
          '请求异常1:error--->  ${exception.msg} requestTag--> $requestTag stackTrace---> ${stackTrace.toString()}');
      if (request._needToast) {
        TDToast.showToast(exception.msg);
      }
    } else {
      jdLog('请求异常2---> ${exception.toString()}');
      errorMsg = exception.toString();
      errorCode = -101;
      if (request._needToast) {
        TDToast.showToast(errorMsg);
      }
    }
    _runZonedIfNotNull(request._loadListener?.onRequestFail
        ?.call(requestTag, exception, stackTrace));
    return {
      'error': {'errorMsg': errorMsg, 'errorCode': errorCode}
    };
  } finally {
    _requestingList.remove(requestTag);
    final duration = DateTime.now().duration - startTime.duration;
    if (duration > const Duration(seconds: 3)) {
      // LoggerUtil.e('接口请求时间过长:[tag: $requestTag, duration: $duration]');
    }
  }
}

/// 解析响应
Future<Map<String, dynamic>> _requestInner(
    JDApiRequest request, String requestTagOnce) async {
  try {
    String requestFullUrl = JDApiRequest._generateRequestUrl(request);
    Map<String, dynamic> params = request.requestParams ?? {};
    Options option = JDApiRequest._generateRequestOption(request);

    jdLog('开始请求requestUrl----->  $requestFullUrl 参数-->  $params');

    Response response = await TDDioInstance().dio.request(
          requestFullUrl,
          queryParameters:
              request._method == JDRequestMethod.get ? params : null,
          data: request._method == JDRequestMethod.postWithFormData
              ? FormData.fromMap(params)
              : params,
          options: option,
          cancelToken: request._cancelToken,
        );
    Map<String, dynamic> responseMap = {};
    dynamic responseData = response.data;
    if (responseData is String) {
      responseData = json.decode(responseData);
    }
    responseMap = responseData;

    return responseMap;
  } on JDApiException {
    rethrow;
  } on DioException catch (exception) {
    if (kDebugMode) {
      throw ApiNetworkException(exception.response?.statusCode ?? -1,
          '${exception.message}', request, exception);
    } else {
      throw ApiNetworkException(
          exception.response?.statusCode ?? -1, '请检查网络~', request, exception);
    }
  } catch (exception) {
    if (kDebugMode) {
      throw JDApiException(
          -101, '系统出现未知错误\n(${exception.toString()})', request, exception);
    } else {
      throw JDApiException(-101, '系统出现未知错误', request, exception);
    }
  }
}

_runZonedIfNotNull<R>(R Function()? body) {
  if (body != null) runZoned(body);
}
