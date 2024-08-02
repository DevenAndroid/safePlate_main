class LoginModel {
  bool? success;
  dynamic message;
  Data? data;
  dynamic accessToken;
  dynamic refreshtoken;

  LoginModel(
      {this.success,
        this.message,
        this.data,
        this.accessToken,
        this.refreshtoken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    refreshtoken = json['refreshtoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['refreshtoken'] = this.refreshtoken;
    return data;
  }
}

class Data {
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic phonenumber;
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