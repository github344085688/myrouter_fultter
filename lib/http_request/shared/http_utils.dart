import './dio_client.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  Future<T> post<T>(String url, dynamic data,{Options options, Map<String, dynamic> queryParams}) {
    return DioClient.request<T>("post", url,
        data: data == null ? {} : data,
        options: options,
        queryParameters: queryParams);
  }

  Future<T> get<T>(String url, {Options options, Map<String, dynamic> queryParams}) {
    return DioClient.request<T>("get", url,
        options: options, queryParameters: queryParams);
  }

  Future<T> put<T>(String url, dynamic data, {Options options, Map<String, dynamic> queryParams}) {
    return DioClient.request<T>("put", url,
        data: data == null ? {} : data,
        queryParameters: queryParams,
        options: options);
  }

  Future<T> delete<T>(String url, dynamic data,{Options options, Map<String, dynamic> queryParams}) {
    return DioClient.request<T>("delete", url,
        data: data, queryParameters: queryParams, options: options);
  }
}

final HttpUtils http = new HttpUtils();
