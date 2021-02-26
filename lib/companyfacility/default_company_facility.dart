class DefaultCompanyFacility {
  String companyId;
  String facilityId;

  DefaultCompanyFacility({this.companyId, this.facilityId});

  DefaultCompanyFacility.fromJson(Map<String, dynamic> json) {
    this.companyId = json['companyId'];
    this.facilityId = json['facilityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['facilityId'] = this.facilityId;
    return data;
  }
}
