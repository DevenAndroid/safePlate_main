import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/dimension.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({super.key});

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {
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
        title: Text("Coming Soon", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Column(
              children: [
                Container(
                  child: Image.asset("assets/images/coming.png"),
                ),
                SizedBox(height: height*0.01,),
                Text("Coming Soon ",
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color:Colors.black),),
                SizedBox(height: height*0.01,),
                Text("Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color:Color(0xff181818)),textAlign: TextAlign.center,),
                SizedBox(height: height*0.1,),


                ElevatedButton(
                    onPressed: () async {
                     Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                      Size(AddSize.screenWidth, AddSize.size50),
                      backgroundColor: Color(0xffFBB742),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text("BACK TO HOME".toUpperCase(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 20))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
