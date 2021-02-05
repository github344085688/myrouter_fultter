import 'package:my_router_flutter/companyfacility/company.dart';
import 'package:my_router_flutter/companyfacility/facility.dart';

class AssignedCompanyFacilities {
  String companyId;
  String facilityId;
  Company company;
  Facility facility;

  AssignedCompanyFacilities({this.companyId, this.facilityId, this.company, this.facility});

  AssignedCompanyFacilities.fromJson(Map<String, dynamic> json) {
    this.companyId = json['companyId'];
    this.facilityId = json['facilityId'];
    this.company = json['company'] != null ? Company.fromJson(json['company']) : null;
    this.facility = json['facility'] != null ? Facility.fromJson(json['facility']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['facilityId'] = this.facilityId;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.facility != null) {
      data['facility'] = this.facility.toJson();
    }
    return data;
  }
}