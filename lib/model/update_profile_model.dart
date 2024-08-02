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
  BMI? bMI;
  int? age;
  List<String>? allergies;
  String? healthConditions;
  bool? isapproved;

  User({this.sId, this.name, this.email, this.phonenumber, this.disabled, this.roles, this.postcode, this.aboutme, this.bMI, this.age, this.allergies, this.healthConditions, this.isapproved});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    disabled = json['disabled'];
    roles = json['roles'];
    postcode = json['postcode'];
    aboutme = json['aboutme'];
    bMI = json['BMI'] != null ? new BMI.fromJson(json['BMI']) : null;
    age = json['age'];
    allergies = json['allergies'].cast<String>();
    healthConditions = json['health_conditions'];
    isapproved = json['isapproved'];
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
    if (this.bMI != null) {
      data['BMI'] = this.bMI!.toJson();
    }
    data['age'] = this.age;
    data['allergies'] = this.allergies;
    data['health_conditions'] = this.healthConditions;
    data['isapproved'] = this.isapproved;
    return data;
  }
}

class BMI {
  dynamic weight;
  dynamic unit;
  dynamic ft;
  String? In;
  dynamic unit2;

  BMI({this.weight, this.unit, this.ft, this.In, this.unit2});

  BMI.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    unit = json['Unit'];
    ft = json['ft'];
    In = json['In.'];
    unit2 = json['Unit_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['Unit'] = this.unit;
    data['ft'] = this.ft;
    data['In.'] = this.In;
    data['Unit_2'] = this.unit2;
    return data;
  }
}
