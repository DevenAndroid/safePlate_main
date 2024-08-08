class UpdateProfileModel {
  User? user;
  String? message;
  bool? success;

  UpdateProfileModel({this.user, this.message, this.success});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phonenumber;
  bool? disabled;
  String? roles;
  String? postcode;
  String? aboutme;
  int? age;
  String? gender;
  String? healthConditions;
  bool? isapproved;
  String? weight;
  String? unit;
  String? ft;
  String? inch;
  String? unit2;

  User({this.sId, this.name, this.email, this.phonenumber, this.disabled, this.roles, this.postcode, this.aboutme, this.age, this.gender, this.healthConditions, this.isapproved, this.weight, this.unit, this.ft, this.inch, this.unit2});

User.fromJson(Map<String, dynamic> json) {
sId = json['_id'];
name = json['name'];
email = json['email'];
phonenumber = json['phonenumber'];
disabled = json['disabled'];
roles = json['roles'];
postcode = json['postcode'];
aboutme = json['aboutme'];
age = json['age'];
gender = json['gender'];
healthConditions = json['health_conditions'];
isapproved = json['isapproved'];
weight = json['weight'];
unit = json['Unit'];
ft = json['ft'];
inch = json['In'];
unit2 = json['Unit2'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['_id'] = this.sId;
data['name'] = this.name;
data['email'] = this.email;
data['phonenumber'] = this.phonenumber;
data['disabled'] = this.disabled;
data['roles'] = this.roles;
data['postcode'] = this.postcode;
data['aboutme'] = this.aboutme;
data['age'] = this.age;
data['gender'] = this.gender;
data['health_conditions'] = this.healthConditions;
data['isapproved'] = this.isapproved;
data['weight'] = this.weight;
data['Unit'] = this.unit;
data['ft'] = this.ft;
data['In'] = this.inch;
data['Unit2'] = this.unit2;
return data;
}
}
