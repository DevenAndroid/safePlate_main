
import 'package:Safeplate/resources/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class TermCondition extends StatefulWidget {
  const TermCondition({super.key});
  static var route = "/termsCondition";

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Color(0xff75D051),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,color: Colors.white,
          ),
        ),
        title: Text("Terms & Conditions", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AddSize.size25,),
            Text("Terms & Conditions",style: GoogleFonts.roboto(
                fontSize:20,
                fontWeight:FontWeight.w500
            ),),
            SizedBox(height: AddSize.size15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",style: GoogleFonts.roboto(
                fontSize:14,
                height:1.5,
                fontWeight:FontWeight.w400
            ),),
            SizedBox(height: AddSize.size25,),
            Text("About the site, generally",style: GoogleFonts.roboto(
                fontSize:20,
                fontWeight:FontWeight.w500
            ),),
            SizedBox(height: AddSize.size15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",style: GoogleFonts.roboto(
                fontSize:14,
                height:1.5,
                fontWeight:FontWeight.w400
            ),),      SizedBox(height: AddSize.size25,),
            Text("About the site, generally",style: GoogleFonts.roboto(
                fontSize:20,
                fontWeight:FontWeight.w500
            ),),
            SizedBox(height: AddSize.size15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",style: GoogleFonts.roboto(
                fontSize:14,
                height:1.5,
                fontWeight:FontWeight.w400
            ),),
            SizedBox(height: AddSize.size15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",style: GoogleFonts.roboto(
                fontSize:14,
                height:1.5,
                fontWeight:FontWeight.w400
            ),), SizedBox(height: AddSize.size15,),




          ],
        ),
      ),

    );
  }
}
