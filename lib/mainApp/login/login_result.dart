import './user_permission.dart';
import './user_view.dart';

class LoginResult {
  String code;
  String oAuthToken;
  String errorMessage;
  bool success;
  int idmUserId;
  UserView userView;
  List<UserPermission> userPermissions;

  LoginResult({this.code, this.oAuthToken, this.success, this.idmUserId, this.userView, this.userPermissions, this.errorMessage});

  LoginResult.fromJson(dynamic json) {
    this.code = json['code'];
    this.oAuthToken = json['oAuthToken'];
    this.success = json['success'];
    this.idmUserId = json['idmUserId'];
    this.errorMessage = json['errorMessage'];
    this.userView = json['userView'] != null ? UserView.fromJson(json['userView']) : null;
    this.userPermissions = (json['userPermissions'] as List) != null ? (json['userPermissions'] as List).map((i) => UserPermission.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['oAuthToken'] = this.oAuthToken;
    print(this.success);
    data['success'] = this.success;
    data['idmUserId'] = this.idmUserId;
    data['errorMessage'] = this.errorMessage;
    if (this.userView != null) {
      data['userView'] = this.userView.toJson();
    }
    data['userPermissions'] = this.userPermissions != null ? this.userPermissions.map((i) => i.toJson()).toList() : null;
    return data;
  }
}




