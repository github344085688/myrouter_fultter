import 'package:dio/dio.dart';

class CompanyIdInterceptor extends InterceptorsWrapper {
  String _companyId = "";

  CompanyIdInterceptor(String companyId) {
    _companyId = companyId;
  }

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (_companyId!=null && _companyId.isNotEmpty) {
      options.headers["WISE-Company-Id"] = _companyId;
    }
  }
}