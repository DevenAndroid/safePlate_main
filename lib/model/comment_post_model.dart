class CommnetOnPostModel {
  Post? post;
  bool? success;
  String? message;

  CommnetOnPostModel({this.post, this.success, this.message});

  CommnetOnPostModel.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Post {
  String? sId;
  String? userId;
  String? name;
  String? caption;
  String? message;
  int? likeCount;
  List<Null>? likes;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Post(
      {this.sId,
        this.userId,
        this.name,
        this.caption,
        this.message,
        this.likeCount,
        this.likes,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    caption = json['caption'];
    message = json['message'];
    likeCount = json['likeCount'];
    // if (json['likes'] != null) {
    //   likes = <Null>[];
    //   json['likes'].forEach((v) {
    //     likes!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['message'] = this.message;
    data['likeCount'] = this.likeCount;
    // if (this.likes != null) {
    //   data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    // }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Comments {
  String? userId;
  String? name;
  String? message;
  List<Null>? likes;
  int? likeCount;
  List<Null>? replies;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.userId,
        this.name,
        this.message,
        this.likes,
        this.likeCount,
        this.replies,
        this.sId,
        this.createdAt,
        this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
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
    // if (json['replies'] != null) {
    //   replies = <Null>[];
    //   json['replies'].forEach((v) {
    //     replies!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.replies != null) {
    //   data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    // }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
