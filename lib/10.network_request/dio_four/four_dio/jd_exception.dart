import 'jd_request.dart';

/// API相关的异常
class JDApiException implements Exception {
  final int code;
  final String _message;
  final JDApiRequest _request;
  final dynamic _data;

  const JDApiException(this.code, this._message, this._request, this._data);

  String get msg => _message;

  JDApiRequest get request => _request;

  dynamic get data => _data;

  @override
  String toString() {
    return '$runtimeType[code: $code message: $msg, request: ${request.runtimeType}, data: $data]';
  }
}

class ApiNetworkException extends JDApiException {
  const ApiNetworkException(
      int code, String message, JDApiRequest request, data)
      : super(code, message, request, data);
}
