import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  String _token = "";
  var headers ;

  TokenInterceptor(String token) {
    _token = token;
  }

  @override
  Future onRequest(RequestOptions options) async {
    if (_token != null && _token.isNotEmpty) {
      options.headers["Authorization"] = _token;
      headers = options.headers;
    }
  }

  @override
  Future onResponse(Response response) async {
    print('``````````````````````````````');
    print(headers);
    print(response);
    print('``````````````````````````````');
  }

  @override
  Future onError(DioError e) async {}
}
