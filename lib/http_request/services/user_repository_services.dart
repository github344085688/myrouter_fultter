import '../shared/http_utils.dart';
import '../../mainApp/login/login_result.dart';

class UserRepositoryServices {
  static const String LOGIN = 'shared/idm-app/user/login';
  // static const String RETRIEVE = 'shared/idm-app/permission/search';
  static const String RETRIEVE = 'shared/idm-app/user/search-by-paging';

  Future<LoginResult> login(String userName, String password) async {
    return LoginResult.fromJson(await http.post(LOGIN, {
      "page": "Web",
      "password": password,
      "returnUserPermissions": ["WEB"],
      "username": userName,
    }));
  }

  Future retrieve(dynamic pass) async {
    return await http.post(RETRIEVE, pass);
  }
}
