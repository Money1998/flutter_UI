class LoginData {
  Data? data;

  LoginData({this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? profilePic;
  String? name;
  String? emailId;

  Data({this.profilePic, this.name, this.emailId});

  Data.fromJson(Map<String, dynamic> json) {
    profilePic = json['profile_pic'];
    name = json['name'];
    emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_pic'] = profilePic;
    data['name'] = name;
    data['email_id'] = emailId;
    return data;
  }
}
