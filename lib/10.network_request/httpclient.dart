// import 'dart:convert';
// import 'dart:io';

// HttpClient是dart⾃带的请求类，在io包中，实现了基本的⽹络请求相关的操作。
// ⽹络调⽤通常遵循如下步骤：
// 1.创建 client.
// 2.构造 Uri.
// 3.发起请求, 等待请求，同时您也可以配置请求headers、body。
// 4.关闭请求, 等待响应.
// 5.解码响应的内容.

// void requestNetwork() async {
//   // 1.创建HttpClient对象
//   final httpClient = HttpClient();
//   // 2.构建请求的uri
//   final uri = Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100");
//   // 3.构建请求
//   final request = await httpClient.getUrl(uri);
//   // 4.发送请求，必须
//   final response = await request.close();
//   var result = await response.transform(utf8.decoder).join();
//   if (response.statusCode == HttpStatus.ok) {
//     print(result);
//   } else {
//     print('response.statusCode:${response.statusCode}');
//   }
// }

//HttpClient虽然可以发送正常的⽹络请求，但是会暴露过多的细节：
//⽐如需要主动关闭request请求，拿到数据后也需要⼿动的进⾏字符串解码
// void getWeatherData() async {
//   try {
//     var httpClient = HttpClient();
//     var httpClientRequest = await httpClient.getUrl(
//         Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
//     var httpClientResponse = await httpClientRequest.close();
//     var result = await httpClientResponse.transform(utf8.decoder).join();
//     // print(result);
//     httpClient.close();
//   } catch (e) {
//     // print("请求失败:$e");
//   } finally {}
// }

// void main(List<String> args) {
//   requestNetwork();
// }
