import 'package:my_router_flutter/mainApp/login/user_role.dart';

import 'package:my_router_flutter/companyfacility/assigned_company_facility.dart';
import 'package:my_router_flutter/companyfacility/company.dart';
import 'package:my_router_flutter/companyfacility/default_company_facility.dart';
import 'package:my_router_flutter/companyfacility/facility.dart';

class UserView {
  String idmUserId;
  String username;
  String ssoUsername;
  String status;
  String firstName;
  String lastName;
  String lastLoginWhen;
  bool isAndroidOnline;
  Company defaultCompany;
  DefaultCompanyFacility defaultCompanyFacility;
  Facility defaultFacility;
  List<AssignedCompanyFacilities> assignedCompanyFacilities;
  List<UserRole> roles;

  UserView({this.idmUserId, this.username, this.ssoUsername, this.status, this.firstName, this.lastName, this.lastLoginWhen, this.isAndroidOnline, this.defaultCompany, this.defaultCompanyFacility, this.defaultFacility, this.assignedCompanyFacilities, this.roles});

  UserView.fromJson(Map<String, dynamic> json) {
    this.idmUserId = json['idmUserId'];
    this.username = json['username'];
    this.ssoUsername = json['ssoUsername'];
    this.status = json['status'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.lastLoginWhen = json['lastLoginWhen'];
    this.isAndroidOnline = json['isAndroidOnline'];
    this.defaultCompany = json['defaultCompany'] != null ? Company.fromJson(json['defaultCompany']) : null;
    this.defaultCompanyFacility = json['defaultCompanyFacility'] != null ? DefaultCompanyFacility.fromJson(json['defaultCompanyFacility']) : null;
    this.defaultFacility = json['defaultFacility'] != null ? Facility.fromJson(json['defaultFacility']) : null;
    this.assignedCompanyFacilities = (json['assignedCompanyFacilities'] as List)!=null?(json['assignedCompanyFacilities'] as List).map((i) => AssignedCompanyFacilities.fromJson(i)).toList():null;
    this.roles = (json['roles'] as List)!=null?(json['roles'] as List).map((i) => UserRole.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {

  }

}




