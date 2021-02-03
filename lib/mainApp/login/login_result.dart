import './user_permission.dart';
import './user_view.dart';

class LoginResult {
  bool success;
  String oAuthToken;
  int idmUserId;
   List<UserPermission> userPermissions;
  LoginResult({this.oAuthToken, this.success, this.idmUserId, this.userPermissions});

  LoginResult.fromJson(dynamic json) {
    this.oAuthToken = json['oAuthToken'];
    this.success = json['success'];
    this.idmUserId = json['idmUserId'];
    this.userPermissions = (json['userPermissions'] as List) != null ? (json['userPermissions'] as List).map((i) => UserPermission.fromJson(i)).toList() : null;
  }
}




