import 'page.dart';

class Result<T> {
  String code;
  String? message;
  Page? page;
  T? data;

  Result({required this.code, this.message, this.data, this.page});

  factory Result.fromResponse(Map<String, dynamic> response,
      T Function(Map<String, dynamic>) fromJson) {
    Page page = Page();
    if (response['page'] != null) {
      page = Page.fromJson(response['page']);
    }

    T data = fromJson(response['data']);
    String message = response['message'];
    String code = response['code'] ?? '200';
    return Result(
      code: code,
      message: message,
      page: page,
      data: data,
    );
  }
}