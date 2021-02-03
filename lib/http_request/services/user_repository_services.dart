import '../shared/http_utils.dart';
import '../../mainApp/login/login_result.dart';
/*

class UserRepositoryServices {
  static const String LOGIN = 'idm-app/user/login';

  Future<LoginResult> login(String userName, String password,
      String accountCode) async {
    return LoginResult.fromJson(await http.post(LOGIN, {
      "channel": "Android",
      "isForceLogin": false,
      "password": password,
      "returnUserPermissions": ["ANDROID"],
      "username": userName,
      "accountCode": accountCode
    }));
  }
}
*/

class UserRepositoryServices {
  static const String LOGIN = 'shared/idm-app/user/login';

  Future login(String userName, String password) async {
    return LoginResult.fromJson(await http.post(LOGIN, {
      "page": "Web",
      "password": password,
      "returnUserPermissions": ["WEB"],
      "username": userName,
    }));
  }
}
