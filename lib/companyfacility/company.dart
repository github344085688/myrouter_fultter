class Company {
  String id;
  String name;
  String status;
  String createdBy;
  String createdWhen;

  Company({this.id, this.name, this.status, this.createdBy, this.createdWhen});

  Company.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.status = json['status'];
    this.createdBy = json['createdBy'];
    this.createdWhen = json['createdWhen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdWhen'] = this.createdWhen;
    return data;
  }
}