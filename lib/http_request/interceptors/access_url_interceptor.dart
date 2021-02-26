import 'package:dio/dio.dart';
import 'package:my_router_flutter/http_request/interceptors/string_util.dart';
class AccessUrlInterceptor extends InterceptorsWrapper {
  static const ACCESS_NO_CHANGE = 0;
  static const ACCESS_SHARE = 1;
  static const ACCESS_FACILITY = 2;

  final accessUrlMap = const {
    "shared": ACCESS_NO_CHANGE,
    "idm-app": ACCESS_SHARE,
    "fd-app": ACCESS_SHARE,
    "print-app": ACCESS_SHARE,
    "file-app": ACCESS_SHARE,
    "push-app": ACCESS_SHARE,
    "bam": ACCESS_FACILITY,
    "base-app": ACCESS_FACILITY,
    "wms-app": ACCESS_FACILITY,
    "inventory-app": ACCESS_FACILITY,
  };

  var _facilityAccessUrl = "";

  AccessUrlInterceptor(String accessUrl) {
    _facilityAccessUrl = accessUrl;
  }

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    var path = options.path;
    var splits = path.split("/").toList();
    if (splits.isNotEmpty) {
      var app = splits[0];
      var accessType = accessUrlMap[app];
      switch (accessType) {
        case ACCESS_SHARE:
          options.path = "shared/" + options.path;
          break;
        case ACCESS_FACILITY:
          if (StringUtil.isEmpty(_facilityAccessUrl)) return;
          options.path = _facilityAccessUrl + "/" + options.path;
          break;
        default:
          break;
      }
    }
  }
}
