import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_router_flutter/http_request/services/user_repository_services.dart';
import './login_result.dart';

class LoginViewModel extends ChangeNotifier {
  BuildContext _context;

  String _accountCode = "";
  String userName = "";
  String password = "";

  Color _loginButtonColor = Colors.white70;
  UserRepositoryServices userRepositoryServices = new UserRepositoryServices();

  LoginViewModel(BuildContext context) {
    _context = context;
  }
  initSteps() {
    userName="tracyh";
    password="qwer1234";
    notifyListeners();
  }
  login() async {
    String errMsg = _validate();
    if (errMsg.isNotEmpty) {
      return;
    }

    try {
      LoginResult loginResult = await userRepositoryServices.login(userName, password);

      if (loginResult != null ) {
        print('~~~~~~~~~~~~~~~~~~~~~~esult ${loginResult}');
      } else {
        String failMsg = "";
        /* switch (loginResult.code) {
          case ErrorCode.PASSWORD_INVALID:
            failMsg = THIS_PASSWORD_IS_INCORRECT;
            break;
          case ErrorCode.USER_INVALID:
            failMsg = ERROR_INVALID_ACCOUNT;
            break;
          case ErrorCode.USER_DISABLED:
          case ErrorCode.USER_LOCKED:
            failMsg = MSG_USER_DISABLE_PLEASE_CONTACT_MANAGER;
            break;
          default:
            failMsg = UNKNOWN_ERROR;
        }

        Fluttertoast.showToast(msg: failMsg);*/
      }
    } catch (e) {}
    /*on HttpRequestException catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }*/
  }

  setUserName(String text) {
    userName = text;
    // _validateAllInputField();
    print('setUserName------${userName}');
  }

  setPassword(String text) {
    password = text;
    // _validateAllInputField();
    print('setPassword+++++${userName}');
  }

  String _validate() {
    if (_accountCode.isEmpty) {
      // return PLEASE_INPUT_ACCOUNT_CODE;
    }

    if (userName.isEmpty) {
      // return PLEASE_INPUT_USER_NAME;
    }

    if (password.isEmpty) {
      // return PLEASE_INPUT_PASSWORD;
    }

    return "";
  }

  setAccountCode(String text) {
    _accountCode = text;
    _validateAllInputField();
  }

  void _validateAllInputField() {
    String errMsg = _validate();
    _loginButtonColor =
        errMsg.isEmpty ? Theme.of(_context).primaryColor : Colors.white70;
    notifyListeners();
  }

  get loginButtonColor => _loginButtonColor;
/*
  void _loadUser(LoginResult loginResult) async {
    await LocalStorage.setToken(loginResult.oAuthToken);
    http.updateToken(loginResult.oAuthToken);

    String companyId = _getCompanyId(loginResult.userView);
    if (companyId == null || companyId.isEmpty || loginResult.userView.assignedCompanyFacilities == null || loginResult.userView.assignedCompanyFacilities.isEmpty) {
      Fluttertoast.showToast(msg: S.of(_context).error_assign_company_and_facility);
      return;
    }

    await LocalStorage.setCompanyId(companyId);
    http.updateCompanyId(companyId);

    try {
      UserView userView = await userRepository.loadUser(loginResult.idmUserId);
      //save user data to local db
      await _saveUser(userView);
      await _saveAssignCompanyAndFacilities(userView);

      locator<NavigationService>().pushNamedAndRemoveUntil(HomePageRoute, (route) => false);
    } on HttpRequestException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }*/
/*
  Future _saveUser(UserView userView) async {
    await LocalStorage.setUserId(userView.idmUserId);
    await userRepository.createOrUpdateUser(userView);
  }

  String _getCompanyId(UserView userView) {
    if (userView == null) return "";

    String defaultCompanyId = userView.defaultCompanyFacility != null ? userView.defaultCompanyFacility.companyId : "";
    String assignedCompanyId = (userView.assignedCompanyFacilities != null && userView.assignedCompanyFacilities.isNotEmpty) ? userView.assignedCompanyFacilities[0].companyId : "";

    return defaultCompanyId == null || defaultCompanyId.isEmpty ? assignedCompanyId : defaultCompanyId;
  }

  Future _saveAssignCompanyAndFacilities(UserView userView) async {
    String previousFacilityId = await LocalStorage.getFacilityId();
    String facilityId;
    String facilityAccessUrl;

    if (StringUtil.isEmpty(previousFacilityId) || !userView.assignedCompanyFacilities.map((companyFacility) => companyFacility.facilityId).toList().contains(previousFacilityId)) {
      facilityId = StringUtil.isNotEmpty(userView.defaultFacility.id) ? userView.defaultFacility.id : userView.assignedCompanyFacilities[0].facilityId;
    } else {
      facilityId = previousFacilityId;
    }

    facilityAccessUrl = userView.assignedCompanyFacilities.firstWhere((companyAndFacility) => companyAndFacility.facilityId == facilityId).facility.accessUrl;

    await LocalStorage.setFacilityId(facilityId);
    await LocalStorage.setFacilityAccessUrl(facilityAccessUrl);
    http.updateAccessUrl(facilityAccessUrl);
    http.updateFacilityId(facilityId);

    List<FacilityEntity> facilities = userView.assignedCompanyFacilities.map((e) {
      Facility facility = e.facility;
      return new FacilityEntity(facility.id, userView.idmUserId, facility.name, facility.useLocationSequence, facility.submitPICountWithPicture, facility.notBlindPICount,
          facility.forbidMovementViaPutAway, facility.collectLocationWifiInfo, facility.accessUrl, facility.labelSize);
    }).toList();

    FacilityRepository facilityRepository = new FacilityRepository();
    await facilityRepository.clearAndSaveFacilities(facilities);
  }*/
}
