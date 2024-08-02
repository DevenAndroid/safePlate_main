class FamilyMemberModel {
  List<Membersdata>? membersdata;
  bool? success;
  dynamic message;

  FamilyMemberModel({this.membersdata, this.success, this.message});

  FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    if (json['Membersdata'] != null) {
      membersdata = <Membersdata>[];
      json['Membersdata'].forEach((v) {
        membersdata!.add(new Membersdata.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.membersdata != null) {
      data['Membersdata'] = this.membersdata!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Membersdata {
  dynamic sId;
  dynamic userId;
  dynamic name;
  dynamic email;
  bool? isverified;
  dynamic phonenumber;
  dynamic relationship;
  dynamic iV;

  Membersdata(
      {this.sId,
        this.userId,
        this.name,
        this.email,
        this.isverified,
        this.relationship,
        this.phonenumber,
        this.iV});

  Membersdata.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    isverified = json['isverified'];
    relationship = json['relationship'];
    phonenumber = json['phonenumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isverified'] = this.isverified;
    data['relationship'] = this.relationship;
    data['phonenumber'] = this.phonenumber;
    data['__v'] = this.iV;
    return data;
  }
}
