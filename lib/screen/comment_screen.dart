// import 'dart:developer';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:readium/Screens/BottomNav%20bar/Dashboard.dart';
// import 'package:readium/model/MyProfile/my_post_model.dart';
// import 'package:readium/model/add_comment_model.dart';
// import 'package:readium/model/comment_list_model.dart';
// import 'package:readium/repo/MyProfile-repo/my_post_repo.dart';
// import 'package:readium/repo/add_comment_repo.dart';
// import 'package:readium/repo/add_reply_repo.dart';
// import 'package:readium/repo/get_reply_repo.dart';
// import 'package:readium/widgets/app_assets.dart';
// import 'package:readium/widgets/circular_progressindicator.dart';
// import 'package:readium/widgets/common_textfield.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../controller/comment_controller.dart';
// import '../../controller/language_controller.dart';
// import '../../model/add_like_model.dart';
// import '../../model/all_media_model.dart';
// import '../../repo/all_media_repo.dart';
// import '../../repo/delete_comment_repo.dart';
// import '../../repo/get_comment_repo.dart';
// import '../../repo/like_comment_repo.dart';
// import '../../repo/other_user_post_repo.dart';
// import '../../resourses/apiUrl.dart';
// import '../../widgets/common_colour.dart';
// import '../widget/helper.dart';
//
// class CommentScreen extends StatefulWidget {
//   String id = "";
//   CommentScreen(this.id);
//
//   @override
//   State<CommentScreen> createState() => _CommentScreenState();
// }
//
// class _CommentScreenState extends State<CommentScreen> {
//   String post = '';
//   String id = '';
//   TextEditingController comment = TextEditingController();
//   TextEditingController replyController = TextEditingController();
//   final formKey6 = GlobalKey<FormState>();
//   Rx<AddCommentModel> addComment = AddCommentModel().obs;
//   Rx<RxStatus> statusOfComment = RxStatus.empty().obs;
//   Rx<AddLikeModel> addLike = AddLikeModel().obs;
//   final commentController = Get.put(CommentController());
//   final languageController = Get.put(LanguageController());
//
//   Rx<RxStatus> statusOfRemove = RxStatus.empty().obs;
//   Rx<CommentListModel> commentList = CommentListModel().obs;
//   Rx<RxStatus> statusOfCommentList = RxStatus.empty().obs;
//   getComment() {
//     commentListRepo(widget.id,).then((value) {
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
//   Rx<RxStatus> statusOfreply = RxStatus.empty().obs;
//   Rx<AddCommentModel> addreply = AddCommentModel().obs;
//   addReply() {
//     addCommentReplyRepo(post_id: widget.id,comment: replyController.text.toString(),context: context,comment_id:id).then((value) {
//       print("Comment ID-----------:${widget.id}");
//       print("Post ID-----------:${id}");
//       log("response.body.....    ${value}");
//       addreply.value = value;
//       if (value.status == true) {
//         statusOfreply.value = RxStatus.success();
//         showToast(value.message.toString());
//         getComment();
//         replyController.clear();
//         setState(() {});
//       } else {
//         statusOfreply.value = RxStatus.error();
//         showToast(value.message.toString());
//       }
//     }
//       // showToast(value.message.toString());
//     );
//   }
//   // Rx<RxStatus> statusOfPost = RxStatus.empty().obs;
//   // Rx<MySelfPostModel> myPost = MySelfPostModel().obs;
//   // getPost() {
//   //   myProfilePostRepo().then((value) {
//   //     myPost.value = value;
//   //     if (value.status == true) {
//   //       statusOfPost.value = RxStatus.success();
//   //     } else {
//   //       statusOfPost.value = RxStatus.error();
//   //     }
//   //   }
//   //     // showToast(value.message.toString());
//   //   );
//   // }
//   // Rx<RxStatus> statusOfOtherUserPost = RxStatus.empty().obs;
//   // Rx<MySelfPostModel> otherPost = MySelfPostModel().obs;
//   // getotheruserPost(String? id) {
//   //   otherProfilePostRepo(id:id.toString()).then((value) {
//   //     otherPost.value = value;
//   //     if (value.status == true) {
//   //       statusOfOtherUserPost.value = RxStatus.success();
//   //     } else {
//   //       statusOfOtherUserPost.value = RxStatus.error();
//   //     }
//   //   }
//   //     // showToast(value.message.toString());
//   //   );
//   // }
//   bool showEmojiKeyboard = false;
//   @override
//   void initState() {
//     super.initState();
//     getComment();
//     // print("ID--------------:${widget.id}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         shape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40) // Adjust the radius as needed
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Comments'.tr,
//           style: GoogleFonts.mulish(
//             fontWeight: FontWeight.w700,
//             // letterSpacing: 1,
//             fontSize: 18,
//             color: Colors.black,
//           ),
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       body: Obx(() {
//         return Stack(
//           children: [
//             statusOfCommentList.value.isSuccess
//                 ? SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 child: Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         commentList.value.data!.isNotEmpty
//                             ? ListView.builder(
//                           physics: const ScrollPhysics(),
//                           itemCount: commentList.value.data!.length,
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             var comment = commentList.value.data![index];
//                             // var reply = replyList.value.data![index];
//                             return Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8.0, top: 10, bottom: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ClipOval(
//                                     child: comment.userId!.profileImage == ""
//                                         ? Container(
//                                       padding: EdgeInsets.all(7),
//                                       decoration: BoxDecoration(
//                                           border: Border.all(color: Colors.grey),
//                                           shape: BoxShape.circle),
//                                       child: Icon(Icons.person, color: Colors.black,),
//                                     )
//                                         : CachedNetworkImage(
//                                       width: 40,
//                                       height: 40,
//                                       fit: BoxFit.cover,
//                                       imageUrl: comment.userId!.profileImage.toString(),
//                                       placeholder: (context, url) => const Icon(Icons.person, size: 30,),
//                                       errorWidget: (context, url, error) => const Icon(Icons.person, size: 50,),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                           decoration: BoxDecoration(
//                                               borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),
//                                                   bottomLeft: Radius.circular(10),
//                                                   topRight: Radius.circular(10)),
//                                               color: Color(0xFFF3F3F3)),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       Get.back();
//                                                     },
//                                                     child: Text(
//                                                         overflow: TextOverflow.ellipsis,
//                                                         "${comment.userId!.firstName.toString()} " +
//                                                             " ${comment.userId!.lastName.toString()}",
//                                                         style: TextStyle(color: Color(0xFF283841), fontFamily: "Graphite",
//                                                           fontSize: 14, fontWeight: FontWeight.w500,)),
//                                                   ),
//                                                   const SizedBox(width: 15,),
//                                                   Text(
//                                                       comment.date.toString(),
//                                                       style: TextStyle(color: Color(0xFF3E3E3E), fontFamily: "Graphite",
//                                                         fontSize: 11, fontWeight: FontWeight.w400,)),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 16,),
//                                               Text(
//                                                   comment.comment.toString(),
//                                                   style: TextStyle(color: Color(0xFF26282E), fontFamily: "Graphite",
//                                                     fontSize: 13, fontWeight: FontWeight.w300,
//                                                   )),
//                                               const SizedBox(
//                                                 height: 5,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Row(
//                                             children: [
//                                               GestureDetector(
//                                                   onTap: () {
//                                                     addCommentLikeRepo(context: context, comment_id: comment.id.toString(),
//                                                     ).then((value) async {
//                                                       if (value.status == true) {
//                                                         addLike.value = value;
//                                                         statusOfRemove.value = RxStatus.success();
//                                                         getComment();
//                                                         showToast(value.message.toString());
//                                                         getComment();
//                                                         commentController.getMedia();
//                                                         commentController.getPost();
//                                                         commentController.getotheruserPost(id);
//                                                         setState(() {});
//                                                       } else {
//                                                         statusOfRemove.value = RxStatus.error();
//                                                         // like=false;
//                                                         showToast(value.message.toString());
//                                                         setState(() {});
//                                                       }
//                                                     });
//                                                   },
//                                                   child: comment.isLike == true
//                                                       ? Icon(Icons.heart_broken,color: Colors.red,)
//                                                       : Icon(Icons.monitor_heart_sharp)),
//                                               SizedBox(
//                                                 width: 5,
//                                               ),
//                                               Text(
//                                                 comment.likeCount
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                   color:
//                                                   Color(0xFF6F7F94),
//                                                   fontFamily:
//                                                   "Graphite",
//                                                   fontSize: 12,
//                                                   fontWeight:
//                                                   FontWeight.w300,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 15,
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   id =  comment.id.toString();
//                                                   print("id::::"+id);
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (context) => AlertDialog(
//                                                       title: Text("Reply to Comment".tr,
//                                                           style: TextStyle(color: Colors.black,
//                                                             fontFamily: "Graphite", fontSize: 20, fontWeight: FontWeight.w300,)
//                                                       ),
//                                                       content: TextField(
//                                                         controller: replyController,
//                                                         cursorColor: Colors.grey,
//                                                         maxLength: 500,
//                                                         style: TextStyle(color: Colors.black),
//                                                         decoration: InputDecoration(hintText: "Type your reply...".tr,
//                                                           enabledBorder: UnderlineInputBorder(
//                                                             borderSide: BorderSide(color: Colors.black), // Color of the underline border
//                                                           ),
//                                                           hintStyle: TextStyle(color: Colors.black, fontSize: 16,),),
//                                                         onSubmitted: (replyText) {
//                                                           replyController.text.toString();
//                                                           Get.back();
//                                                         },
//                                                       ),
//                                                       actions: <Widget>[
//                                                         TextButton(
//                                                           onPressed: () {
//                                                             Get.back();
//                                                           },
//                                                           child: Text('Cancel'.tr,
//                                                               style: TextStyle(color: Colors.black,
//                                                                 fontFamily: "Graphite", fontSize: 12, fontWeight: FontWeight.w300,)
//                                                           ),
//                                                         ),
//                                                         TextButton(
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               addReply();
//                                                               Get.back();
//                                                             });
//                                                           },
//                                                           child: Text('Reply'.tr,
//                                                               style: TextStyle(color: Colors.black,
//                                                                 fontFamily: "Graphite", fontSize: 12, fontWeight: FontWeight.w300,)
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: Text("Reply".tr,
//                                                   style: TextStyle(color: Colors.black,
//                                                     fontFamily: "Graphite", fontSize: 12, fontWeight: FontWeight.w300,
//                                                   ),),
//                                               ),
//                                               SizedBox(width: 5,),
//                                               //               reply.comment.isNotEmpty
//                                               //               ?Container(
//                                               //                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                                               //                   decoration: BoxDecoration(
//                                               //                   borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),
//                                               //                       bottomLeft: Radius.circular(10),
//                                               //                       topRight: Radius.circular(10)),
//                                               //                       color: Color(0xFFF3F3F3)),
//                                               //               child: Text(reply.comment),
//                                               // )
//                                               //     : SizedBox(),
//                                               // Spacer(),
//                                               // comment.myAccount == true || comment.myComment == true
//                                               //     ? TextButton(
//                                               //     onPressed: () {
//                                               //       deleteCommentRepo(deleteId: comment.id.toString(), context: context).then((value) {
//                                               //         if (value.status == true) {
//                                               //           showToast(value.message.toString());
//                                               //           getComment();
//                                               //         } else {
//                                               //           showToast(value.message.toString());
//                                               //         }
//                                               //       });
//                                               //     },
//                                               //     child: Text(
//                                               //       'Delete'.tr,
//                                               //       style:
//                                               //       GoogleFonts
//                                               //           .mulish(
//                                               //         fontWeight:
//                                               //         FontWeight
//                                               //             .w700,
//                                               //         // letterSpacing: 1,
//                                               //         fontSize: 14,
//                                               //         color: Colors
//                                               //             .black,
//                                               //       ),
//                                               //     ))
//                                               //     : const SizedBox(),
//                                             ]),
//                                         SizedBox(height: 5,),
//                                         comment.replys!= null && comment.replys!.isNotEmpty
//                                             ? ListView.builder(
//                                             itemCount: comment.replys!.length,
//                                             shrinkWrap: true,
//                                             itemBuilder: (context,index){
//                                               return Column(
//                                                 children: [
//                                                   Row(
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       ClipOval(
//                                                         child: comment.replys![index].replyUserId!.profileImage == ""
//                                                             ? Container(
//                                                           padding: EdgeInsets.all(7),
//                                                           decoration: BoxDecoration(
//                                                               border: Border.all(color: Colors.grey),
//                                                               shape: BoxShape.circle),
//                                                           child: Icon(Icons.person, color: Colors.black,),
//                                                         )
//                                                             : CachedNetworkImage(
//                                                           width: 40,
//                                                           height: 40,
//                                                           fit: BoxFit.cover,
//                                                           imageUrl: comment.replys![index].replyUserId!.profileImage.toString(),
//                                                           placeholder: (context, url) => const Icon(Icons.person, size: 30,),
//                                                           errorWidget: (context, url, error) => const Icon(Icons.person, size: 50,),
//                                                         ),
//                                                       ),
//                                                       SizedBox(width: 5,),
//                                                       Container(
//                                                         width: MediaQuery.of(context).size.width*0.64
//                                                         ,
//                                                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                                         decoration: BoxDecoration(
//                                                             borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),
//                                                                 bottomLeft: Radius.circular(10),
//                                                                 topRight: Radius.circular(10)),
//                                                             color: Color(0xFFF3F3F3)),
//                                                         child: Column(
//                                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                                           children: [
//                                                             Row(
//                                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                                               children: [
//                                                                 GestureDetector(
//                                                                   onTap: () {
//                                                                     Get.back();
//                                                                   },
//                                                                   child: Text(
//                                                                       overflow: TextOverflow.ellipsis,
//                                                                       "${comment.replys![index].replyUserId!.firstName.toString()} " +
//                                                                           " ${comment.replys![index].replyUserId!.lastName.toString()}",
//                                                                       style: TextStyle(color: Color(0xFF283841), fontFamily: "Graphite",
//                                                                         fontSize: 14, fontWeight: FontWeight.w500,)),
//                                                                 ),
//                                                                 const SizedBox(width: 15,),
//                                                                 // Text(
//                                                                 //     comment.date.toString(),
//                                                                 //     style: TextStyle(color: Color(0xFF3E3E3E), fontFamily: "Graphite",
//                                                                 //       fontSize: 11, fontWeight: FontWeight.w400,)),
//                                                               ],
//                                                             ),
//                                                             const SizedBox(height: 16,),
//                                                             Text(
//                                                                 comment.replys![index].replyComment.toString(),
//                                                                 style: TextStyle(fontFamily: "Graphite",color: Color(0xFF26282E),
//                                                                   fontSize: 13, fontWeight: FontWeight.w300,
//                                                                 )),
//                                                             const SizedBox(
//                                                               height: 5,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left: 210),
//                                                     child: comment.replys![index].myAccount == true || comment.replys![index].replyComment == true
//                                                         ? TextButton(
//                                                         onPressed: () {
//                                                           deleteCommentRepo(deleteId: comment.replys![index].id.toString(), context: context).then((value) {
//                                                             if (value.status == true) {
//                                                               showToast(value.message.toString());
//                                                               getComment();
//                                                             } else {
//                                                               showToast(value.message.toString());
//                                                             }
//                                                           });
//                                                         },
//                                                         child: Text(
//                                                           'Delete'.tr,
//                                                           style:
//                                                           GoogleFonts
//                                                               .mulish(
//                                                             fontWeight:
//                                                             FontWeight
//                                                                 .w700,
//                                                             // letterSpacing: 1,
//                                                             fontSize: 14,
//                                                             color: Colors
//                                                                 .black,
//                                                           ),
//                                                         ))
//                                                         : const SizedBox(),
//                                                   ),
//                                                   SizedBox(height: 20,),
//                                                 ],
//                                               );}
//                                         ) : SizedBox()
//                                         /*   ListView.builder(
//                                                       shrinkWrap: true,
//                                                       itemCount: 2,
//                                                       itemBuilder: (context, index) {
//                                                       return  Padding(
//                                                         padding: const EdgeInsets.all(8.0),
//                                                         child: Row(children: [
//                                                           ClipOval(
//                                                             child: comment.userId!
//                                                                 .profileImage ==
//                                                                 ""
//                                                                 ? Container(
//                                                               padding:
//                                                               EdgeInsets.all(7),
//                                                               decoration: BoxDecoration(
//                                                                   border: Border.all(
//                                                                       color: Colors
//                                                                           .grey),
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                               child: Icon(
//                                                                 Icons.person,
//                                                                 color: Colors.black,
//                                                               ),
//                                                             )
//                                                                 : CachedNetworkImage(
//                                                               width: 26,
//                                                               height: 26,
//                                                               fit: BoxFit.cover,
//                                                               imageUrl: comment
//                                                                   .userId!
//                                                                   .profileImage
//                                                                   .toString(),
//                                                               placeholder:
//                                                                   (context, url) =>
//                                                               const Icon(
//                                                                 Icons.person,
//                                                                 size: 26,
//                                                               ),
//                                                               errorWidget: (context,
//                                                                   url, error) =>
//                                                               const Icon(
//                                                                 Icons.person,
//                                                                 size: 26,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           SizedBox(width: 10),
//                                                           Text("${"swsw"}:")
//
//                                                         ],),
//                                                       );
//                                                     },)
//
//                                                   */
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         )
//                             : Padding(
//                           padding: languageController.selectedLAnguage.value == "English"
//                               ? const EdgeInsets.symmetric(horizontal: 90,vertical: 150)
//                               : const EdgeInsets.symmetric(horizontal: 140,vertical: 150),
//                           child: Text("No Comment Found".tr,
//                               style: TextStyle(
//                                 color: Color(0xFF283841),
//                                 fontFamily: "Graphite",
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               )),
//                         ),
//                         const SizedBox(height: 40,),
//                       ],
//                     ),
//                   ),
//                 ))
//                 : Center(child: CircularProgressIndicator()),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Builder(
//                 builder: (BuildContext context) {
//                   final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
//                   return SingleChildScrollView(
//                     reverse: true,
//                     child:   Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
//                       child: Container(
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xFF165142).withOpacity(0.14),
//                               spreadRadius: 5,
//                               blurRadius: 5,
//                               offset: const Offset(2, 2), // changes the position of the shadow
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: TextFormField(
//                             keyboardType: TextInputType.text,
//                             controller:comment,
//                             maxLength: 500,
//                             style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w400,
//                               fontFamily: "Graphite",
//                               color: Colors.black,
//                             ), autofocus: false,cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.send),
//                                 onPressed: () {
//                                   setState(() {
//                                     addCommentRepo(context: context, comment: comment.text.toString(), post_id: widget.id).then((value) {
//                                       addComment.value = value;
//                                       if (value.status == true) {
//                                         statusOfComment.value = RxStatus.success();
//                                         getComment();
//                                         showToast(value.message.toString());
//                                         comment.text = "";
//                                         Get.back();
//                                         commentController.getMedia();
//                                         commentController.getPost();
//                                         commentController.getotheruserPost(id);
//                                         print("User_Id-------------:${id}");
//                                         // Get.offAllNamed('/bottom');
//                                       } else {
//                                         statusOfComment.value = RxStatus.error();
//                                         showToast(value.message.toString());
//                                       }
//                                     });
//                                   });
//                                 },
//                               ),
//                               // prefix: Padding(
//                               //   padding: const EdgeInsets.only(right: 10),
//                               //   child: SvgPicture.asset(AppAssets.smile,height: 18,),
//                               // ),
//                               hintText: 'Add Comment...'.tr,
//                               hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300,
//                                 fontFamily: "Graphite", color: Color(0xFF5C6878),
//                               ),
//                               contentPadding: const EdgeInsets.only(left: 22, top: 0,bottom: 0),
//                               disabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(color: Colors.transparent,),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(color: Colors.transparent,),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(color: Colors.transparent,),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               border: OutlineInputBorder(
//                                   borderSide: const BorderSide(color: Colors.transparent,),
//                                   borderRadius: BorderRadius.circular(30)),
//                             ),
//
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter some text'.tr;
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     // child: Padding(
//                     //     padding: EdgeInsets.only(
//                     //       bottom: keyboardHeight > 10 ? keyboardHeight : 12,
//                     //       left: 18.0,
//                     //       right: 17,
//                     //     ),
//                     //     child: CommonTextfield(
//                     //       hintText: "Type your message...",
//                     //       suffixIcon: IconButton(
//                     //         icon: Padding(
//                     //           padding: const EdgeInsets.only(bottom: 1.0),
//                     //           child: SvgPicture.asset(
//                     //             AppAssets.send,
//                     //           ),
//                     //         ),
//                     //         onPressed: () {
//                     //           addCommentRepo(
//                     //                   context: context,
//                     //                   comment: comment.text.toString(),
//                     //                   post_id: widget.id)
//                     //               .then((value) {
//                     //             addComment.value = value;
//                     //             if (value.status == true) {
//                     //               statusOfComment.value = RxStatus.success();
//                     //               getComment();
//                     //               showToast(value.message.toString());
//                     //               comment.text = "";
//                     //               Get.offAllNamed('/bottom');
//                     //             } else {
//                     //               statusOfComment.value = RxStatus.error();
//                     //
//                     //               showToast(value.message.toString());
//                     //             }
//                     //           });
//                     //           // Add functionality to send the message here
//                     //         },
//                     //       ),
//                     //       prefix: Padding(
//                     //         padding: const EdgeInsets.only(bottom: 13.0),
//                     //         child: SvgPicture.asset(AppAssets.smile),
//                     //       ),
//                     //       controller: comment,
//                     //     )
//
//                     // Container(
//                     //   padding: EdgeInsets.symmetric(horizontal: 15),
//                     //   decoration: BoxDecoration(
//                     //     border: Border.all(color: Colors.black),
//                     //     borderRadius: BorderRadius.circular(15),
//                     //   ),
//                     //   child: Row(
//                     //     children: [
//                     //       SvgPicture.asset(AppAssets.smile),
//                     //       SizedBox(
//                     //         width: 10,
//                     //       ),
//                     //
//                     //       // Expanded(
//                     //       //   child: TextField(
//                     //       //     controller: comment,
//                     //       //     style: const TextStyle(
//                     //       //       fontSize: 16,
//                     //       //       fontWeight: FontWeight.w400,
//                     //       //       fontFamily: "Graphite",
//                     //       //       color: AppTheme.primaryColor,
//                     //       //     ),
//                     //       //     decoration: InputDecoration(
//                     //       //       contentPadding: EdgeInsets.only(bottom: 6),
//                     //       //       hintText: 'Type your message...',
//                     //       //       border: InputBorder.none,
//                     //       //       hintStyle: GoogleFonts.urbanist(
//                     //       //         color: Colors.black,
//                     //       //         fontSize: 16,
//                     //       //         fontWeight: FontWeight.w400,
//                     //       //       ),
//                     //       //     ),
//                     //       //   ),
//                     //       // ),
//                     //       // IconButton(
//                     //       //   icon: SvgPicture.asset(AppAssets.send),
//                     //       //   onPressed: () {
//                     //       //     addCommentRepo(
//                     //       //             context: context,
//                     //       //             comment: comment.text.toString(),
//                     //       //             post_id: widget.id)
//                     //       //         .then((value) {
//                     //       //       addComment.value = value;
//                     //       //       if (value.status == true) {
//                     //       //         statusOfComment.value = RxStatus.success();
//                     //       //         showToast(value.message.toString());
//                     //       //       } else {
//                     //       //         statusOfComment.value = RxStatus.error();
//                     //       //         showToast(value.message.toString());
//                     //       //       }
//                     //       //     });
//                     //       //     // Add functionality to send the message here
//                     //       //   },
//                     //       // ),
//                     //     ],
//                     //   ),
//                     // ),
//
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
