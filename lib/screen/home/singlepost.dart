

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/single_post_model.dart';
import '../../repo/single_post_repo.dart';
import '../../widget/helper.dart';

class SinglePostScreen extends StatefulWidget {
  // String? id;
   SinglePostScreen({super.key});


  static var route = "/singlePostScreen";
  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {

  // Rx<RxStatus> statusOfmycomment = RxStatus.empty().obs;
  // Rx<SinglePostModel> model = SinglePostModel().obs;
  // void getData() {
  //   singlePostRepo(context: context).then((value) {
  //     model.value = value;
  //     if (value.success == true) {
  //       log('Success in getData');
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         statusOfmycomment.value = RxStatus.success();
  //       });
  //     } else {
  //       log('Error in getData');
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         statusOfmycomment.value = RxStatus.error();
  //       });
  //     }
  //   }).catchError((error) {
  //     log('Error in getData(): $error');
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       statusOfmycomment.value = RxStatus.error();
  //     });
  //   });
  // }

  // Rx<CommnetOnPostModel> model2 = CommnetOnPostModel().obs;
  // Rx<RxStatus> statusOfcomment = RxStatus.empty().obs;

  TextEditingController  commentController = TextEditingController();
  @override
  void initState() {
    // getData();
    // print("iddddddddddddddddddddd${widget.id.toString()}");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height ;
    var width= MediaQuery.sizeOf(context).width ;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: const Color(0xff75D051),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,color: Colors.white,
          ),
        ),
        title: Text("Single Post", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),

      ),

      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/user.png",height: 50,width: 50,),
                  ),
                  SizedBox(width: width*0.04,),
                  Text("Welcome Adrian!",style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w500, color:Colors.black),),

                ],),
                SizedBox(height: height*0.01,),
                Container(
                  height: 200,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Image.asset("assets/images/order.png",fit: BoxFit.fill,),
                ),
                SizedBox(height: height*0.02),
                Text("Why did the vegetable go to the doctor? Because it had a bad peeling. "
                  //model.value.post!.name.toString()
                  ,style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color:Colors.black),),
                SizedBox(height: height*0.02),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w400, color:Colors.black,),
                  textAlign: TextAlign.start,),

                SizedBox(height: height*0.04,),
                Text("Comments",style:GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, color:Colors.black),),
                SizedBox(height: height*0.02,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:3,
                itemBuilder: (context, index) {
                return  Obx(() {

                  return

                    Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/images/user.png",height:50,width:50,),
                              ),
                              SizedBox(width: width*0.03),
                              Text("Alex smith",
                                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color:Colors.black,),),
                              const Spacer(),
                              Text("12min",
                                style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w300, color:Colors.black,),)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60,right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                                  style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w300, color:Color(0xff545454),),),
                                SizedBox(height: height*0.01),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){},
                                        child: Text("Like" ,
                                          style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),)),
                                    SizedBox(width: width*0.06),
                                    InkWell(
                                        onTap: (){},
                                        child: Text("Reply",
                                          style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),))
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                });
              },),
                SizedBox(height: height*0.05,),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green,width: 2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextFormField(

controller: commentController,
                      decoration: InputDecoration(

                        hintText: 'Post Comment',
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.roboto(
                          fontSize:19,
                          fontWeight:FontWeight.w400
                        )

                      ),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/Emojis.svg"),
           SizedBox(width: 15,),
           GestureDetector(
               onTap: (){
                 // print("iddddddddddddddd${widget.id.toString()}");
                 //
                 // commentPOst(
                 //   name: model2.value.post.comments.,
                 //     productId:  widget.id.toString(),
                 //     context: context, message:commentController.text )
                 //     .then((value) {
                 //   model2.value = value;
                 //   if (value.success == true) {
                 //     showToast(value.message);
                 //     statusOfcomment.value = RxStatus.success();
                 //     getData();
                 //   } else {
                 //     showToast(value.message);
                 //     statusOfcomment.value = RxStatus.error();
                 //   }
                 // });
               },
               child: SvgPicture.asset("assets/icons/Send.svg"))
            ],
          ),
        ),

                SizedBox(height: height*0.05,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
