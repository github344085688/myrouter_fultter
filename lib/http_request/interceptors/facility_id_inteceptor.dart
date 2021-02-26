import 'package:dio/dio.dart';

class FacilityInterceptor extends InterceptorsWrapper{
  String _facilityId = "";

  FacilityInterceptor(String facilityId) {
    _facilityId = facilityId;
  }

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (_facilityId!=null && _facilityId.isNotEmpty) {
      options.headers["wise-facility-id"] = _facilityId;
    }
  }
}