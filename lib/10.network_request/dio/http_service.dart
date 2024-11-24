import 'package:dio/dio.dart';
import 'package:learn520/10.network_request/dio/app_config.dart';
import 'result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

typedef FromJson<T> = T Function(Map<String, dynamic>);

class HttpService {
  late Dio _dio;

  HttpService() {
    dotenv.load(fileName: ".env.dev");
    //  请求的配置
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    //添加⼀个拦截器，添加headers
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final xKongUserId = dotenv.env['X_KONG_USER_ID'];
        final xKongCountry = dotenv.env['X_KONG_COUNTRY'];
        options.headers['Cookie'] =
            'x_kong_user_id=$xKongUserId;x_kong_country=$xKongCountry';
        return handler.next(options);
      },
    ));
  // 添加⼀个拦截器，处理结果和错误
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  Future<Result<T>> _request<T>(String url,
      {String method = 'get',
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      required FromJson<T> fromJson}) async {
    final response = await _dio.request(url,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method));
    final result = Result.fromResponse(response.data, fromJson);
    return result;
  }
// 调用上面的方法，发起get请求
  Future<Result<T>> get<T>(String url,
      {Map<String, dynamic>? queryParameters, required FromJson<T> fromJson}) {
    return _request<T>(url,
        queryParameters: queryParameters, fromJson: fromJson);
  }
// 调用上面的方法，发起post请求
  Future<Result<T>> post<T>(String url,
      {Map<String, dynamic>? data, required FromJson<T> fromJson}) {
    return _request<T>(url, method: 'post', data: data, fromJson: fromJson);
  } 
}
