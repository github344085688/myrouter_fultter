class UserPermission {
  String name;
  String category;

  UserPermission({this.name, this.category});

  UserPermission.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }
}
