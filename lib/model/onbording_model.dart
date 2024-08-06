class BoardingModel {
  Data? data;
  String? message;
  bool? success;

  BoardingModel({this.data, this.message, this.success});

  BoardingModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? sId;
  String? splashicon;
  String? appicon;
  String? applogo;
  List<Onboarding>? onboarding;
  int? iV;

  Data(
      {this.sId,
        this.splashicon,
        this.appicon,
        this.applogo,
        this.onboarding,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    splashicon = json['splashicon'];
    appicon = json['appicon'];
    applogo = json['applogo'];
    if (json['onboarding'] != null) {
      onboarding = <Onboarding>[];
      json['onboarding'].forEach((v) {
        onboarding!.add(new Onboarding.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['splashicon'] = this.splashicon;
    data['appicon'] = this.appicon;
    data['applogo'] = this.applogo;
    if (this.onboarding != null) {
      data['onboarding'] = this.onboarding!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Onboarding {
  int? step;
  Dataa? dataa;
  String? sId;

  Onboarding({this.step, this.dataa, this.sId});

  Onboarding.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    dataa = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step'] = this.step;
    if (this.dataa != null) {
      data['data'] = this.dataa!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Dataa {
  String? icon;
  String? headerText;
  String? caption;

  Dataa({this.icon, this.headerText, this.caption});

  Dataa.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    headerText = json['header-text'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['header-text'] = this.headerText;
    data['caption'] = this.caption;
    return data;
  }
}
