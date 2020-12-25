import 'package:dio/dio.dart';
import 'api_confige.dart';
var  options  = BaseOptions(
  connectTimeout: CONNECT_TIMEOUT,
  receiveTimeout: RECEIVE_TIMEOUT,
  responseType: ResponseType.plain,
  validateStatus: (status) {
    // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
    return true;
  },
    baseUrl:BASE_API,
);