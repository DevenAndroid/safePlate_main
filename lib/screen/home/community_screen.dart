import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/screen/home/my_favourite_post.dart';
import 'package:Safeplate/screen/home/singlepost.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../../model/all_post_community_model.dart';
import '../../model/like_post_model.dart';
import '../../model/mypostcommunity_model.dart';
import '../../repo/all_post_community_repo.dart';
import '../../repo/like_repo.dart';
import '../../repo/my_post_community_repo.dart';
import '../../widget/helper.dart';
import 'my_post.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  Rx<RxStatus> statusOfpost = RxStatus.empty().obs;
  Rx<ModelAllCommunity> model = ModelAllCommunity().obs;
  void getData1() {
    allPostRepo().then((value) {
      model.value = value;
      if (value.success == true) {
        statusOfpost.value = RxStatus.success();
      } else {
        statusOfpost.value = RxStatus.error();
      }
    }).catchError((error) {
      statusOfpost.value = RxStatus.error();
      log('Error in getFollower(): $error');
      // Handle the error as needed, e.g., show a toast message
      // showToast('Error fetching followers: $error');
    });
  }

  RxInt refreshInt = 0.obs;

  Rx<RxStatus> statusOfmylike = RxStatus.empty().obs;
  Rx<LikePostModel> Likemodel = LikePostModel().obs;

  @override
  void initState() {
    super.initState();
    getData1();
  }
  void shareProduct(String name, String description, String url) {
    final String text = 'Check out this product: $name\n\n$description\n\n$url';
    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    final String productName = 'Awesome Product';
    final String productDescription = 'This product is really awesome.';
    final String productUrl = 'https://example.com/product';
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
          "Community",
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: InkWell(
              onTap: () {
                Get.to(const MyPostScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      "My Post",
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
            child:
           Obx((){
             if (refreshInt.value > 0) {}
             return  statusOfpost.value.isSuccess
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
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset(
                                   "assets/images/user.png",
                                 )),
                           ),
                         ),
                         SizedBox(width: width * 0.04),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
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
                             //       borderRadius: BorderRadius.circular(10),
                             //       color: Colors.white),
                             //   child: Padding(
                             //     padding: const EdgeInsets.symmetric(
                             //         horizontal: 16, vertical: 8),
                             //     child: Row(
                             //       crossAxisAlignment:
                             //       CrossAxisAlignment.center,
                             //       mainAxisAlignment:
                             //       MainAxisAlignment.center,
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
                                               getData1();
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
                                           color: const Color(0xffEF535E),
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
                                           color: const Color(0xff273B4A)),
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
                                         onPressed: () async {
                                         await   Share.share('https://wallpaperaccess.com/full/1401021.jpg',
                                                subject: 'Welcome Message');
                                         },
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

           })
          ),
        ),
      ),
    );
  }
}
