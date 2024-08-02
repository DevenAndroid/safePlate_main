class CreatePostCommunity {
  String? message;
  bool? success;
  Post? post;

  CreatePostCommunity({this.message, this.success, this.post});

  CreatePostCommunity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  String? userId;
  String? name;
  String? caption;
  String? message;
  int? likeCount;
  String? sId;
  List<Null>? likes;
  List<Null>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Post(
      {this.userId,
        this.name,
        this.caption,
        this.message,
        this.likeCount,
        this.sId,
        this.likes,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    caption = json['caption'];
    message = json['message'];
    likeCount = json['likeCount'];
    sId = json['_id'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['message'] = this.message;
    data['likeCount'] = this.likeCount;
    data['_id'] = this.sId;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}