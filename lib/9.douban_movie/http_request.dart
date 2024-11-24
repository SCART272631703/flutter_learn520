// import 'package:dio/dio.dart';
// import 'http_config.dart';

// class HttpRequest {
//   // 1.创建实例对象
//   static BaseOptions baseOptions =
//       BaseOptions(connectTimeout: const Duration(seconds: HTTPConfig.timeout));

//   static Dio dio = Dio(baseOptions);
//   static Future<T> request<T>(String url,
//       {String method = "get", Map<String, dynamic> ? params}) async {
//     // 1.单独相关的设置
//     Options options = Options();
//     options.method = method;
//     // 2.发送⽹络请求
//     try {
//       Response response =
//           await dio.request<T>(url, queryParameters: params, options: options);
//       return response.data;
//     } on DioException catch (e) {
//       throw e;
//     }
//   }
// }
