import 'package:dio/dio.dart';
import 'dio_options.dart';

class DioModule {
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';
  static Dio dio = new Dio(options);

  /// http request methods
  static clear() {
    dio = null;
  }
}
