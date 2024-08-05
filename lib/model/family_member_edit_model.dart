class FamilyMemberEditModel {
  User? user;
  String? message;
  bool? success;

  FamilyMemberEditModel({this.user, this.message, this.success});

  FamilyMemberEditModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? name;
  String? password;
  String? email;
  bool? isverified;
  // List<Null>? refreshtoken;
  int? iV;
  String? phonenumber;
  String? relationship;

  User(
      {this.sId,
        this.userId,
        this.name,
        this.password,
        this.email,
        this.isverified,
        // this.refreshtoken,
        this.iV,
        this.phonenumber,
        this.relationship});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    isverified = json['isverified'];
    // if (json['refreshtoken'] != null) {
    //   refreshtoken = <Null>[];
    //   json['refreshtoken'].forEach((v) {
    //     refreshtoken!.add(new Null.fromJson(v));
    //   });
    // }
    iV = json['__v'];
    phonenumber = json['phonenumber'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['isverified'] = this.isverified;
    // if (this.refreshtoken != null) {
    //   data['refreshtoken'] = this.refreshtoken!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    data['phonenumber'] = this.phonenumber;
    data['relationship'] = this.relationship;
    return data;
  }
}
