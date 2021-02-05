import 'package:my_router_flutter/mainApp/local_storage/shared_preference.dart';

const TOKEN = "token";
const COMPANY_ID = "companyId";
const FACILITY_ACCESS_URL = "accessUrl";
const USER_ID = "userId";
const FACILITY_ID = "facilityId";

class LocalStorage {
  static Future<String> getToken() async {
    return await SharedPreference.get(TOKEN);
  }

  static Future<bool> setToken(String token) async {
    return await SharedPreference.set(TOKEN, token);
  }

  static Future<bool> setCompanyId(String companyId) async {
    return await SharedPreference.set(COMPANY_ID, 'ORG-1');
  }

  static Future<String> getCompanyId() async {
    return await SharedPreference.get(COMPANY_ID);
  }

  static Future<String> getFacilityAccessUrl() async {
    return await SharedPreference.get(FACILITY_ACCESS_URL);
  }

  static Future<bool> setFacilityAccessUrl(String accessUrl) async {
    return await SharedPreference.set(FACILITY_ACCESS_URL, accessUrl);
  }

  static Future<bool> setUserId(String idmUserId) async {
    return await SharedPreference.set(USER_ID, idmUserId);
  }

  static Future<String> getUserId() async {
    return await SharedPreference.get(USER_ID);
  }

  static Future<String> getFacilityId() async {
    return await SharedPreference.get(FACILITY_ID);
  }

  static Future<bool> setFacilityId(String facilityId) async {
    return await SharedPreference.set(FACILITY_ID, facilityId);
  }
}
