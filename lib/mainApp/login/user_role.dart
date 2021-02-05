class UserRole {
  String name;
  int id;

  UserRole({this.name, this.id});

  UserRole.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
