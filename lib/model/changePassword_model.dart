class ChangePasswordModel {
  bool? sucess;
  String? email;
  String? message;

  ChangePasswordModel({this.sucess, this.email, this.message});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    sucess = json['sucess'];
    email = json['email'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sucess'] = this.sucess;
    data['email'] = this.email;
    data['message'] = this.message;
    return data;
  }
}
