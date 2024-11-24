import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// _internal 内部的
class HttpUtils {
  static final HttpUtils _instance = HttpUtils._internal();
  late Dio dio;

  factory HttpUtils() {
    return _instance;
  }

  HttpUtils._internal() {
    dotenv.load(fileName: ".env.dev");
    dio = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: 5000), // 连接超时时间
        receiveTimeout: const Duration(milliseconds: 5000), // 响应超时时间
        //1. 设置请求头
        headers: {"resource": "android"},
        //2. 设置请求头内容的类型
        contentType: Headers.formUrlEncodedContentType,

        //3. 响应类型：共有四种方式json,bytes(响应字节),stream（响应流）,plain
        responseType: ResponseType.json));
    // interceptors 拦截器
    dio.interceptors.add(CookieManager(CookieJar()));

    dio.interceptors.add(InterceptorsWrapper(
      // 在请求之前的拦截信息
      onRequest: (options, handler) {
        final xKongUserId = dotenv.env['X_KONG_USER_ID'];
        final xKongCountry = dotenv.env['X_KONG_COUNTRY'];
        options.headers['Cookie'] =
            'x_kong_user_id=$xKongUserId;x_kong_country=$xKongCountry';
        return handler.next(options);
      },
      // 在响应之前的拦截信息
      onResponse: (response, handler) {
        return handler.next(response);
      },
      // 错误之前的拦截信息
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  // 发送GET请求
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return dio.get(url, queryParameters: params);
  }

  // 发送POST请求
  Future<Response> post(String url, {Map<String, dynamic>? params}) async {
    return dio.post(url, data: params);
  }
}

void main(List<String> args) {
  // 使用方法
  HttpUtils().get('https://example.com/api/data');
}
