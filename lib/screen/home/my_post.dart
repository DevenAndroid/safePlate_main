import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../repo/create_community_repo.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/helper.dart';

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
                          return "Email or Phone is required";
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
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height ;
    var width= MediaQuery.sizeOf(context).width ;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: const Color(0xff75D051),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,color: Colors.white,
          ),
        ),
        title: Text("My Post", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: InkWell(
              onTap: (){
                _showBottomSheet();
                // Get.to(());
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Center(
                    child: Text("Create Post", style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w500, color:Colors.black),),
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
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical:8),
            child: Column(
              children: [
                SizedBox(height: height*0.01,),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffE9F7E3),
                      borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: const Color(0xff75D051),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/images/user.png",)),
                          ),
                        ),
                        SizedBox(width: width*0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Welcome Adrian!", style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w500, color:Colors.black),),
                            SizedBox(height: height*0.01,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Sort By", style: GoogleFonts.roboto(
                                        fontSize: 14, fontWeight: FontWeight.w400,
                                        color:Colors.black),),
                                    const Icon(Icons.keyboard_arrow_down_sharp,color:Colors.black,size: 22,)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.036),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                          child: Column(
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("assets/images/user.png",height: 50,width: 50,),
                                ),
                                SizedBox(width: width*0.06,),
                                Text("Adrian!",style: GoogleFonts.roboto(
                                    fontSize: 16, fontWeight: FontWeight.w500, color:Colors.black),),
                                const Spacer(),
                                IconButton(onPressed: (){},
                                    icon: Image.asset("assets/icons/dislike.png",
                                      height: 22,width: 22,color: const Color(0xffEF535E),)
                                  //Icon(Icons.heart_broken,color: Colors.red,size: 22,)
                                )
                              ],),
                              SizedBox(height: height*0.02,),
                              Container(
                                height: 200,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: Image.asset("assets/images/order.png",fit: BoxFit.fill,),
                              ),
                              SizedBox(height: height*0.02,),
                            ],
                          ),
                        ),
                      ),
                    );
                  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



