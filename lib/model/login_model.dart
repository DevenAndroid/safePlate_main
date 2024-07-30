class LoginModel {
  String? message;
  bool? success;
  Data? data;

  LoginModel({this.message,this.success, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'] ??true;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? phonenumber;
  bool? disabled;

  Data({this.sId, this.name, this.email, this.phonenumber, this.disabled});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['disabled'] = this.disabled;
    return data;
  }
}
