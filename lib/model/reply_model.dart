class ReplyModel {
  Comment? comment;
  bool? success;
  String? message;

  ReplyModel({this.comment, this.success, this.message});

  ReplyModel.fromJson(Map<String, dynamic> json) {
    comment =
    json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comment != null) {
      data['comment'] = this.comment!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Comment {
  String? userId;
  String? name;
  String? message;
  // List<Null>? likes;
  int? likeCount;
  List<Replies>? replies;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Comment(
      {this.userId,
        this.name,
        this.message,
        // this.likes,
        this.likeCount,
        this.replies,
        this.sId,
        this.createdAt,
        this.updatedAt});

  Comment.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    message = json['message'];
    // if (json['likes'] != null) {
    //   likes = <Null>[];
    //   json['likes'].forEach((v) {
    //     likes!.add(new Null.fromJson(v));
    //   });
    // }
    likeCount = json['likeCount'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['message'] = this.message;
    // if (this.likes != null) {
    //   data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    // }
    data['likeCount'] = this.likeCount;
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Replies {
  String? userId;
  String? name;
  String? message;
  // List<Null>? likes;
  int? likeCount;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Replies(
      {this.userId,
        this.name,
        this.message,
        // this.likes,
        this.likeCount,
        this.sId,
        this.createdAt,
        this.updatedAt});

  Replies.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    message = json['message'];
    // if (json['likes'] != null) {
    //   likes = <Null>[];
    //   json['likes'].forEach((v) {
    //     likes!.add(new Null.fromJson(v));
    //   });
    // }
    likeCount = json['likeCount'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['message'] = this.message;
    // if (this.likes != null) {
    //   data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    // }
    data['likeCount'] = this.likeCount;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
