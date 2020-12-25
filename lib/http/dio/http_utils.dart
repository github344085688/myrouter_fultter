import 'dio_client.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  Future<T> post<T>(String url, dynamic params, {Options options}) {
    return DioClient.request<T>("post", url, params);
  }
}

final HttpUtils http = new HttpUtils();
