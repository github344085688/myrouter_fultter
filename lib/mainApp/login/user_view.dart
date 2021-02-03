

class UserView {
  String idmUserId;
  String username;
  String ssoUsername;
  String status;
  String firstName;
  String lastName;
  String lastLoginWhen;
  bool isAndroidOnline;

  UserView({this.idmUserId, this.username, this.ssoUsername, this.status, this.firstName, this.lastName, this.lastLoginWhen, this.isAndroidOnline});

  UserView.fromJson(Map<String, dynamic> json) {    
    this.idmUserId = json['idmUserId'];
    this.username = json['username'];
    this.ssoUsername = json['ssoUsername'];
    this.status = json['status'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.lastLoginWhen = json['lastLoginWhen'];
    this.isAndroidOnline = json['isAndroidOnline'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idmUserId'] = this.idmUserId;
    data['username'] = this.username;
    data['ssoUsername'] = this.ssoUsername;
    data['status'] = this.status;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['lastLoginWhen'] = this.lastLoginWhen;
    data['isAndroidOnline'] = this.isAndroidOnline;
    return data;
  }

}




