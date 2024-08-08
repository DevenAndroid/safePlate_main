

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../model/single_post_model.dart';
import '../../repo/single_post_repo.dart';
import '../../widget/helper.dart';

class SinglePostScreen extends StatefulWidget {
  String? id;
   SinglePostScreen({super.key,this.id});



  static var route = "/singlePostScreen";
  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {





  Rx<SinglePostModel> single = SinglePostModel().obs;
  Rx<RxStatus> statusOfSingle = RxStatus.empty().obs;
  singlePost(){
    singlePostRepo(id:widget.id.toString(), context: context).then((value) {
      log("response.body.....    ${value}");
      single.value = value;
      if (value.success == true) {
       // timesData();
        statusOfSingle.value = RxStatus.success();
        showToast(value.message);
        print("11111111111111111111111${value.message.toString()}");
          // Output will be in the desired time format, e.g., "10:21 AM"

      } else {
        showToast(value.message);
        print("222222222222222222222222${value.message.toString()}");
        statusOfSingle.value = RxStatus.error();
      }
    });
  }




  String formatTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    DateFormat timeFormat = DateFormat.jm(); // You can use any desired time format here
    return timeFormat.format(parsedDate);
  }
  // dynamic time;


  TextEditingController  commentController = TextEditingController();
  @override
  void initState() {
    singlePost();
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
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Obx((){
              return statusOfSingle.value.isSuccess?
               // model.value.success == true ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/user.png",height: 50,width: 50,),
                    ),
                    SizedBox(width: width*0.04,),
                    Text("Welcome ${single.value.post!.name.toString()} !",style: GoogleFonts.roboto(
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
                  Text(
                    single.value.post!.caption.toString()
                    //"Why did the vegetable go to the doctor? Because it had a bad peeling. "
                    //model.value.post!.name.toString()
                    ,style:
                    GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color:Colors.black),),
                  SizedBox(height: height*0.02),
                  Text(
              single.value.post!.message.toString(),
                    //"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                    style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w400, color:Colors.black,),
                    textAlign: TextAlign.start,),

                  SizedBox(height: height*0.04,),
                  // Text( single.value.post!.comments!.length.toString()),
                  Text("Comments",style:GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, color:Colors.black),),
                  SizedBox(height: height*0.02,),
                  single.value.post!.comments!.length == 0?
                  SizedBox(height: 50, width: width,
                    child:  Text("No Comments Any user"),):
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:   single.value.post!.comments!.length,
                    itemBuilder: (context, index) {
                      String formattedTime = formatTime(single.value.post!.comments![index].createdAt.toString());

                      return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset("assets/images/user.png",height:50,width:50,),
                                        ),
                                        SizedBox(width: width*0.03),
                                        Text( single.value.post!.comments![index].name.toString(),                                      //"Alex smith",
                                          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color:Colors.black,),),
                                        const Spacer(),
                                        Text(
                      formattedTime,
                                          //single.value.post!.comments![index].createdAt.toString(),
                                          //"12min",
                                          style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w300, color:Colors.black,),)
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60,right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            single.value.post!.comments![index].message.toString(),
                                            //"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                                            style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w300, color:Color(0xff545454),),),
                                          SizedBox(height: height*0.01),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                                onTap: (){},
                                                child: Text("Reply",
                                                  style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),)),
                                          )
                                          // Row(
                                          //   children: [
                                          //     InkWell(
                                          //         onTap: (){},
                                          //         child: Text("Like" ,
                                          //           style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),)),
                                          //     SizedBox(width: width*0.06),
                                          //     InkWell(
                                          //         onTap: (){},
                                          //         child: Text("Reply",
                                          //           style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),))
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                             SizedBox(height: Get.height*0.01),
                             ListView.builder(
                               shrinkWrap: true,
                               itemCount: 1,// single.value.post!.comments![index].replies!.length,
                               itemBuilder: (context, index) {
                                 String formattedTime2 = formatTime( single.value.post!.comments![index].replies![0].createdAt.toString(),);

                             //   time = single.value.post!.comments![index].replies![index].createdAt;
                               return  Padding(
                                 padding: const EdgeInsets.only(left:30),
                                 child: Container(
                                   // color: Colors.blue,
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           ClipRRect(
                                             borderRadius: BorderRadius.circular(10),
                                             child: Image.asset("assets/images/user.png",height:40,width:40),
                                           ),
                                           SizedBox(width: width*0.03),
                                           Text(single.value.post!.comments![index].replies![0].name.toString(),                                      //"Alex smith",
                                             style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color:Colors.black,),),
                                           const Spacer(),
                                           Text(
                                             formattedTime2,
                                            // single.value.post!.comments![index].replies![index].createdAt.toString(),
                                             //single.value.post!.comments![index].createdAt.toString(),
                                             //"12min",
                                             style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w300, color:Colors.black,),)
                                         ],
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left: 60,right: 10),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [
                                             Text(
                                            single.value.post!.comments![index].replies![0].message.toString(),
                                             //  single.value.post!.comments![index].message.toString(),
                                               //"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                                               style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w300, color:Color(0xff545454),),),
                                             SizedBox(height: height*0.01),
                                             Align(
                                               alignment: Alignment.topLeft,
                                               child: InkWell(
                                                   onTap: (){},
                                                   child: Text("Reply",
                                                     style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),)),
                                             )
                                             // Row(
                                             //   children: [
                                             //     // InkWell(
                                             //     //     onTap: (){},
                                             //     //     child: Text("Like" ,
                                             //     //       style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),)),
                                             //     // SizedBox(width: width*0.06),
                                             //     InkWell(
                                             //         onTap: (){},
                                             //         child: Text("Reply",
                                             //           style:GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, color:Colors.black),))
                                             //   ],
                                             // )
                                           ],
                                         ),
                                       ),

                                     ],
                                   ),

                                 ),
                               );
                             },)
                            ],
                          ),
                        );

                    },)
                  ,

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
              )

              : const Center(child: CircularProgressIndicator());
            })
          ),
        ),
      ),
    );
  }
}
