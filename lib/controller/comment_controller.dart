// import 'dart:developer';
// import 'package:get/get.dart';
//
// class CommentController extends GetxController {
//   String id = " ";
//   String userid = " ";
//   Rx<CommentListModel> commentList = CommentListModel().obs;
//   Rx<RxStatus> statusOfCommentList = RxStatus.empty().obs;
//
//   Rx<RxStatus> statusOfMedia = RxStatus.empty().obs;
//   Rx<MyPostProfileModel> allMedia = MyPostProfileModel().obs;
//   getComment() {
//     commentListRepo(id).then((value) {
//       log("response.body.....    ${value}");
//       commentList.value = value;
//       if (value.status == true) {
//         statusOfCommentList.value = RxStatus.success();
//       } else {
//         statusOfCommentList.value = RxStatus.error();
//       }
//     }
//       // showToast(value.message.toString());
//     );
//   }
//
//   getMedia() {
//     allMediaRepo().then((value) {
//       log("response.body... get media..    ${value}");
//       allMedia.value = value;
//       if (value.status == true) {
//         statusOfMedia.value = RxStatus.success();
//       } else {
//         statusOfMedia.value = RxStatus.error();
//       }
//     }
//     );
//   }
//
//   Rx<RxStatus> statusOfPost = RxStatus.empty().obs;
//   Rx<MySelfPostModel> myPost = MySelfPostModel().obs;
//   getPost() {
//     myProfilePostRepo().then((value) {
//       myPost.value = value;
//       if (value.status == true) {
//         statusOfPost.value = RxStatus.success();
//       } else {
//         statusOfPost.value = RxStatus.error();
//       }
//     }
//       // showToast(value.message.toString());
//     );
//   }
//   Rx<RxStatus> statusOfOtherUserPost = RxStatus.empty().obs;
//   Rx<MySelfPostModel> otherPost = MySelfPostModel().obs;
//   getotheruserPost(String? id) {
//     otherProfilePostRepo(id: userid.toString()).then((value) {
//       otherPost.value = value;
//       if (value.status == true) {
//         statusOfOtherUserPost.value = RxStatus.success();
//       } else {
//         statusOfOtherUserPost.value = RxStatus.error();
//       }
//     }
//       // showToast(value.message.toString());
//     );
//   }
// ////other user profile
// }
