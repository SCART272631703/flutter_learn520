import 'package:http/http.dart' as http;
import 'dart:io';
// http 是 Dart 官⽅提供的另⼀个⽹络请求类，相⽐于HttpClient，易⽤性提升了不少。
// 不用手动关闭request请求，不用⼿动字符串解码，但是没有默认集成到Dart的SDK中
void httpNetwork() async {
  // 1.创建Client
  final client = http.Client();
  // 2.构建uri
  final url = Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100");
  // 3.发送请求
  final response = await client.get(url);
  // 4.获取结果
  if (response.statusCode == HttpStatus.ok) {
    // print(response.body);
  } else {
    // print(response.statusCode);
  }
}

void main(List<String> args) {
  httpNetwork();
}
