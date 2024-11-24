import 'package:dio/dio.dart';

// _internal 内部的
class HttpUtils {
  static final HttpUtils _instance = HttpUtils._internal();
  late Dio dio;

  factory HttpUtils() {
    return _instance;
  }

  HttpUtils._internal() {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 5000), // 连接超时时间
      receiveTimeout: const Duration(milliseconds: 5000), // 响应超时时间
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
