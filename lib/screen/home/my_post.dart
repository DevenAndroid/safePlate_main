import 'dart:developer';
import 'dart:ui';

import 'package:Safeplate/screen/home/singlepost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../model/like_post_model.dart';
import '../../model/mypostcommunity_model.dart';
import '../../repo/create_community_repo.dart';
import '../../repo/like_repo.dart';
import '../../repo/my_post_community_repo.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/helper.dart';
import 'my_favourite_post.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Rx<RxStatus> statusOfmypost = RxStatus.empty().obs;
  Rx<MyPostCommunity> model = MyPostCommunity().obs;
  Rx<RxStatus> statusOfmylike = RxStatus.empty().obs;
  Rx<LikePostModel> Likemodel = LikePostModel().obs;

  void getData() {
    myPostRepo().then((value) {
      model.value = value;
      if (value.success == true) {
        statusOfmypost.value = RxStatus.success();
      } else {
        statusOfmypost.value = RxStatus.error();
      }
    }).catchError((error) {
      statusOfmypost.value = RxStatus.error();
      log('Error in getFollower(): $error');
      // Handle the error as needed, e.g., show a toast message
      // showToast('Error fetching followers: $error');
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.86,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: Color(0xff75D051),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: Get.height * 0.02,),
                    Text(
                      'Submit a piece',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Text(
                      "Name",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.006),
                    CommonTextFieldWidget(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      hint: 'Enter Your Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      "Caption",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.006),
                    CommonTextFieldWidget(
                      controller: captionController,
                      textInputAction: TextInputAction.next,
                      hint: 'Caption',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Caption is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      "Message",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.006),
                    CommonTextFieldWidget(
                      controller: messageController,
                      maxLines: 8,
                      minLines: 4,
                      textInputAction: TextInputAction.next,
                      hint: 'Submit Your Photo or Text',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Submit Your Photo or Text is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      "Upload Photo",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.006),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/upload.png",
                            height: 36,
                            width: 36,
                          ),
                          Text(
                            "Upload Image",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.04,),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            createCommunityRepo(
                                name: nameController.text,
                                context: context,
                                message: messageController.text,
                                caption: captionController.text

                            ).then((value) {
                              if(value.success == true){
                                print("data${value.message}");
                                showToast(value.message);
                                Get.back();
                              }
                              else {
                                print("data>>>>>>>");
                                showToast(value.message);
                              }
                            }


                            );
                          }


                          // Get.back();
                        },
                        style: ElevatedButton.styleFrom(

                          minimumSize: Size(Get.width, 50),
                          backgroundColor: Color(0xffFBB742),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text("Submit".toUpperCase(),
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 20))),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  RxInt refreshInt = 0.obs;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: const Color(0xff75D051),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            "My Post",
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () {
                  _showBottomSheet();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Center(
                      child: Text(
                        "Create Post",
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Obx(() {
                if (refreshInt.value > 0) {}
                return statusOfmypost.value.isSuccess
                    ? Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffE9F7E3),
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 16),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 40,
                                    backgroundColor: const Color(0xff75D051),
                                    child: Center(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/images/user.png",
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.04),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome Adrian!",
                                        style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      // SizedBox(
                                      //   height: height * 0.01,
                                      // ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       color: Colors.white),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.symmetric(
                                      //         horizontal: 16, vertical: 8),
                                      //     child: Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.center,
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         Text(
                                      //           "Sort By",
                                      //           style: GoogleFonts.roboto(
                                      //               fontSize: 14,
                                      //               fontWeight: FontWeight.w400,
                                      //               color: Colors.black),
                                      //         ),
                                      //         const Icon(
                                      //           Icons.keyboard_arrow_down_sharp,
                                      //           color: Colors.black,
                                      //           size: 22,
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.036),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.value.post!.length,
                            itemBuilder: (context, index) {
                              DateTime dateTime = DateTime.parse(model.value.post![index].createdAt.toString());
                              String formattedDate = DateFormat('yyyy dd MMMM').format(dateTime);
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 26),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const SinglePostScreen());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/images/user.png",
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.06,
                                              ),
                                              Text(
                                                model.value.post![index].name
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              const Spacer(),


                                              IconButton(
                                                  onPressed: () {
                                                    addToCart(
                                                        productId:  model.value.post![index].sId.toString(),
                                                        context: context)
                                                        .then((value) {
                                                      Likemodel.value = value;
                                                      if (value.success == true) {
                                                        showToast(value.message);
                                                        statusOfmylike.value = RxStatus.success();
                                                        getData();
                                                      } else {
                                                        showToast(value.message);
                                                        statusOfmylike.value = RxStatus.error();
                                                      }
                                                    });
                                                  },


                                                  icon:

                                                  model.value.post![index].likeCount == 0?

                                                  Image.asset(
                                                    "assets/icons/dislike.png",
                                                    height: 22,
                                                    width: 22,
                                                    color:
                                                        const Color(0xffEF535E),
                                                  ):SvgPicture.asset("assets/icons/fillheart.svg" ,height: 22,
                                                    width: 22,)
                                                  //Icon(Icons.heart_broken,color: Colors.red,size: 22,)
                                                  )
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.016,
                                          ),
                                          Container(
                                            height: 200,
                                            width: width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            child: Image.asset(
                                              "assets/images/order.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.006,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                          formattedDate,
                                                style: GoogleFonts.outfit(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff273B4A)),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    "assets/icons/comment.png",
                                                    height: 22,
                                                    width: 22,
                                                    color: Colors.black,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    "assets/icons/share.png",
                                                    height: 22,
                                                    width: 22,
                                                    color: Colors.black,
                                                  ))
                                            ],
                                          ),
                                          // Text(
                                          //   model.value.post![index].comments
                                          //       .toString(),
                                          //   style: GoogleFonts.roboto(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.w400,
                                          //       color: Colors.black),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : Center(child: CircularProgressIndicator());
              }),
            ),
          ),
        ));
  }
}



