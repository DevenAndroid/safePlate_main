import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/screen/add_familymember_screen.dart';

class CommunityAndMyPosts extends StatefulWidget {
  const CommunityAndMyPosts({super.key});
  static var route = "/addNewMember";

  @override
  State<CommunityAndMyPosts> createState() => _CommunityAndMyPostsState();
}

class _CommunityAndMyPostsState extends State<CommunityAndMyPosts> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height ;
    var width= MediaQuery.sizeOf(context).width ;
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor: Color(0xffEF535E),
        onPressed: (){

          Get.toNamed(AddFamilyMember.route);
        },
          child:Icon(
            Icons.add,color: Colors.white,
          )
      ) ,

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
        title: Text("My Family Member", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),
      ),
      body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 ListView.builder(
                   itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context, index) {
                   return ListTile(
                   // dense: true,
                     leading: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: Image.asset("assets/images/user.png"),

                     ),
                     title: Text("Bryan Williams",style:GoogleFonts.roboto(
                         fontSize: 16, fontWeight: FontWeight.w500, color:Colors.black),),
                     subtitle: Text("Husband",style:GoogleFonts.roboto(
                         fontSize: 14, fontWeight: FontWeight.w400, color:Colors.black),),
                     trailing:
                     SizedBox(
                       width:width*0.15,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           GestureDetector(
                               onTap:(){},
                               child: Image.asset("assets/icons/edit.png",height: 20,width: 20,)),
                           GestureDetector(
                               onTap: (){},
                               child: Image.asset("assets/icons/delete.png",height: 20,width: 20,))
                           // IconButton(onPressed: onPressed, icon: icon)
                         ],
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
