import 'package:Safeplate/screen/Notification_screen.dart';
import 'package:Safeplate/screen/PrivacySecurity_screen.dart';
import 'package:Safeplate/screen/home/community_screen.dart';
import 'package:Safeplate/screen/termscondition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/resources/dimension.dart';


import '../settings/communityandmyposts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  static var route = "/settingScreen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: Text("Settings", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),

      ),
       body: SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
         child: Column(
           children: [
             SizedBox(
               height: AddSize.size20,
             ),
             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {
                  Get.toNamed(PrivacyPolicy.route);
               },
               child: moreData(
                   SvgPicture.asset("assets/setting/lock_security_password.svg"),
                   "Privacy And Security"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),
             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {
                 Get.toNamed(TermCondition.route);
               },
               child: moreData(
                 Image.asset("assets/icons/condition.png",height: 22,width: 15,),
                   // SvgPicture.asset("assets/icons/condition.png",height: 22,width: 22,color: ,),
                   "Terms & Conditions"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),
             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {
                 // Get.toNamed(FAQsScreen.route);
               },
               child: moreData(
                     SvgPicture.asset("assets/setting/language.svg"),
                   "Language"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),
             // GestureDetector(
             //   onTap:() {
             //     Get.toNamed(AboutUsScreen.route);
             //   },
             //   child: moreData(const Icon(Icons.error_outline,color: AppTheme.primaryColor), "About us"),
             // ),
             // SizedBox(
             //   height: AddSize.size20,
             // ),

             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {
                 Get.to(const CommunityAndMyPosts());
               },
               child: moreData(
                  SvgPicture.asset("assets/setting/family_icon 1.svg"),
                   "My Family"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),
             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {
                  Get.toNamed(NotificationScreen.route);
               },
               child: moreData(
                   const Icon(Icons.notifications_none_sharp,
                       color: Color(0xff75D051)),
                   "Notifications"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),
             GestureDetector(
               behavior: HitTestBehavior.translucent,
               onTap: () {

                 Get.to(const CommunityScreen());
               },
               child: moreData(
                     SvgPicture.asset("assets/setting/community.svg"),
                   "Community And My Posts"),
             ),
             SizedBox(
               height: AddSize.size20,
             ),


             // SizedBox(
             //   height: AddSize.size20,
             // ),
             // GestureDetector(
             //   behavior: HitTestBehavior.translucent,
             //   onTap: () {
             //     showDialog(
             //       context: context,
             //       builder: (BuildContext context) {
             //         return Dialog(
             //           child: SingleChildScrollView(
             //             child: Padding(
             //                 padding: EdgeInsets.symmetric(
             //                   horizontal: AddSize.padding16,
             //                 ),
             //                 child: Column(
             //                   mainAxisSize: MainAxisSize.min,
             //                   crossAxisAlignment: CrossAxisAlignment.start,
             //                   children: [
             //                     SizedBox(height: AddSize.size10),
             //                     Text("Are You sure!\nYou want to delete your account?",
             //                         style: TextStyle(
             //                             fontWeight: FontWeight.w500,
             //                             fontSize: AddSize.font16)),
             //                     Row(
             //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
             //                       children: [
             //                         TextButton(
             //                           child: Text("Yes",
             //                               style: TextStyle(
             //                                   fontWeight: FontWeight.w500,
             //                                   color: AppTheme.primaryColor,
             //                                   fontSize: AddSize.font14)),
             //                           onPressed: () {
             //                             deleteUser().then((value){
             //                               if(value.status == true){
             //                                 showToast(value.message);
             //                               }
             //                               else{
             //                                 showToast(value.message);
             //                               }
             //                             });
             //                           },
             //                         ),
             //                         TextButton(
             //                           child: Text("No",
             //                               style: TextStyle(
             //                                   fontWeight: FontWeight.w500,
             //                                   color: AppTheme.primaryColor,
             //                                   fontSize: AddSize.font14)),
             //                           onPressed: () {
             //                             Get.back();
             //                           },
             //                         ),
             //                       ],
             //                     ),
             //                     SizedBox(
             //                       height: AddSize.size20,
             //                     ),
             //                   ],
             //                 )),
             //           ),
             //         );
             //       },
             //     );
             //   },
             //   child: moreData(
             //       const Icon(
             //         Icons.delete_outline,
             //           color:Colors.black
             //       ),
             //       "Delete User"),
             // ),
             GestureDetector(
                 behavior: HitTestBehavior.translucent,
                 onTap: () async {
                 },
                 child: moreData(
                   const Icon(
                     Icons.logout,
                     color:Color(0xff75D051)
                   ),
                   "Logout",
                 )),
             SizedBox(
               height: AddSize.size20,
             ),
           ],
         ),
       )
    );
  }
  moreData(Widget icon, title) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Center(child: icon),
              SizedBox(width: AddSize.size15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, fontSize: AddSize.font14)),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black
            ,
            size: 20,
          ),
        ],
      ),
    );
  }
}
