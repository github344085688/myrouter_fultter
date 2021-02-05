import 'package:dio/dio.dart';
import 'dart:math' as math;

class LogsInterceptors extends InterceptorsWrapper {
  final logSize = 128;

  @override
  Future onRequest(RequestOptions options) {
    print('-------------------------- Request -----------------------------');
    printKV('uri', options.uri);
    printKV('method', options.method);
    printKV('contentType', options.contentType.toString());
    printKV('responseType', options.responseType.toString());
    printKV('extra', options.extra);

    StringBuffer stringBuffer = new StringBuffer();
    options.headers.forEach((key, v) => stringBuffer.write('\n  $key:$v'));
    printKV('header', stringBuffer.toString());
    stringBuffer.clear();

    print("data:");
    printAll(options.data);
    print('-------------------------- Request -----------------------------');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('-------------------------- Response -----------------------------');
    _printResponse(response);
    print('-------------------------- Response -----------------------------');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('-------------------------- Error -----------------------------');
    print(err);
    if (err.response != null) {
      _printResponse(err.response);
    }
    print('-------------------------- Error -----------------------------');
    return super.onError(err);
  }

  void _printResponse(Response response) {
    printKV('uri', response.request.uri);
    printKV('statusCode', response.statusCode);
    if(response.isRedirect)
      printKV('redirect',response.realUri);
    print("headers:");
    print(" " + response.headers.toString().replaceAll("\n", "\n "));

    print("Response Text:");
    printAll(response.toString());
    print("");
  }

  printKV(String key, Object v) {
    print('$key: $v');
  }

  printAll(msg) {
    msg.toString().split("\n").forEach(_printAll);
  }

  _printAll(String msg) {
    int groups = (msg.length / logSize).ceil();
    for (int i = 0; i < groups; ++i) {
      print(msg.substring(
          i * logSize, math.min<int>(i * logSize + logSize, msg.length)));
    }
  }
}
