class ModelAllCommunity {
  List<Post>? post;
  String? message;
  bool? success;

  ModelAllCommunity({this.post, this.message, this.success});

  ModelAllCommunity.fromJson(Map<String, dynamic> json) {
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post!.add(new Post.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['success'] = this.success;
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
  List<Null>? comments;
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
