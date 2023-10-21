class LoginRequestModel{
String email ;
String password;

LoginRequestModel(this.email, this.password);

Map<String,dynamic> toJson(){
 return {
  'email':email,
  'password':password
  };
 }
}


class LoginResponseModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  LoginResponseModel({this.message, this.data, this.status, this.code});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class Data {
  String? token;
  String? username;

  Data({this.token, this.username});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}
