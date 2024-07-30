import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class MyFavouritePostScreen extends StatefulWidget {
  const MyFavouritePostScreen({super.key});

  @override
  State<MyFavouritePostScreen> createState() => _MyFavouritePostScreenState();
}

class _MyFavouritePostScreenState extends State<MyFavouritePostScreen> {
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
        title: Text("My Favourite Post", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),


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
                SizedBox(height: height*0.04,),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
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
                                    icon: Image.asset("assets/icons/like.png",height: 22,width: 22,color: const Color(0xffEF535E),)
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
