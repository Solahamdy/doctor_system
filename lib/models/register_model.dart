
class RegisterRequestModel {
  String name;
  String email;
  String phone;
  int gender;
  String pass ;
  String confirmation;
  RegisterRequestModel({required this.email, required this.name,
    required this.gender,required this.phone
    ,required this.confirmation,required this.pass});



  Map <String, dynamic> toJson()  {
    return
      {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'password': pass,
        'password_confirmation': confirmation,

      };
  }


}

class RegisterResponseModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  RegisterResponseModel({this.message, this.data, this.status, this.code});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  Data({this.name, this.email, this.phone, this.gender, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'].cast<String>();
    email = json['email'].cast<String>();
    phone = json['phone'].cast<String>();
    gender = json['gender'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['password'] = password;
    return data;
  }
}
