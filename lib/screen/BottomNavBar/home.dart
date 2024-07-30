import 'dart:ui';

import 'package:Safeplate/screen/chat_screen/chat_screen.dart';
import 'package:Safeplate/screen/home/community_screen.dart';
import 'package:Safeplate/screen/home/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/network_images.dart';
import '../comingsoon/coming_soon.dart';
import '../scan/scan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static var route = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {int _selectedIndex = 0;

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

final List<Color> colorList = [
  const Color(0xffEF535E),
  const Color(0xffF0A72F),
  const Color(0xff6CB9EB),
  const Color(0xff9F91F3), ];



final List<String> images = [
  'assets/icons/scan.png',
  'assets/icons/community.png',
  'assets/icons/detection.png',
  'assets/icons/health.png',
  // Add more images as needed
];
final List<GridItem> items = [
  GridItem(
   color: const Color(0xffEF535E),
    images:  'assets/icons/scan.png',
    title: 'Scan',
    subtitle: 'Scan food items & barcodes',
  ),
  GridItem(
    color: const Color(0xffF0A72F),
    images:  'assets/icons/community.png',
    title: 'Community',
    subtitle: 'Read or post blogs & articles on health',
  ),
  GridItem(
    color: const Color(0xff6CB9EB),
    images:'assets/icons/detection.png',
    title: 'Start detection',
    subtitle: 'Connect to detector & perform tests',
  ),
  GridItem(
    color:  const Color(0xff9F91F3),
    images: 'assets/icons/health.png',
    title: 'Health & Wellness',
    subtitle: 'Personalized health care chatbot assistant',
  ),
  // Add more items as needed
];



@override
Widget build(BuildContext context) {
  var height= MediaQuery.sizeOf(context).height ;
  var width= MediaQuery.sizeOf(context).width ;
  return Stack(
    children: [
      Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.26,
                  // height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/appbarbg.png"),fit: BoxFit.fill)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.06,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child:
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                    child:  Image.asset("assets/images/user.png")
                                ),
                              ),),
                            Spacer(),
                            //SizedBox(width: Get.width*0.5),
                            Container(
                              decoration:BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 2),
                                  borderRadius: BorderRadius.circular(4)

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Center(
                                  child: Text("Login/signup",style: GoogleFonts.roboto(
                                      fontSize: 10, fontWeight: FontWeight.w400, color:Colors.white),),
                                ),
                              ),
                            ),
                             SizedBox(width: Get.width*0.04),
                            InkWell(
                              onTap: (){
                                Get.to(const SettingScreen());

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/icons/settingicon.png",height: 22,width: 22,),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height:height*0.016),
                        Row(
                          children: [
                            Text("Hello ",style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w300, color:Colors.white),),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/icons/smile.png",height: 22,width: 22,))
                          ],
                        ),
                        SizedBox(height:height*0.006),
                        Text("welcome to Safeplate",style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white),)
                      ],
                    ),
                  ),
                ),


              ],
            ),
            // Container(height: 100,width: 100,color: Colors.red,)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8/1
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: (){
                      if( items[index].title == "Community"){
                        Get.to(const CommunityScreen());
                      }
                      else if(items[index].title == "Scan"){
                        Get.to(const SacanScreen());
                      }
                      else if(items[index].title == "Start detection"){
                        Get.to(const CommingSoonScreen());
                      }
                        else if(items[index].title == "Health & Wellness"){
                          Get.to(ChatScreen());
                        }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: items[index].color,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical:16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  items[index].images
                                  ,height:height*0.04,width:width*0.08,),
                              ),
                            ),
                            SizedBox(height: height*0.02,),
                            Text(
                              items[index].title
                              //"Scan"
                              , style: GoogleFonts.roboto(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),),
                            SizedBox(height: height*0.01,),
                            Text(
                              items[index].subtitle
                              //"Scan food items & barcodes"
                              , style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white,height: 1,),maxLines: 2,),


                          ],
                        ),
                      ),
                    ),
                  );
                },
                // Number of items in the grid
              ),
            )


          ],
        ),



      ),
    ],
  );



}
}


class GridItem {
  final Color color;
  final String images;
  final String title;
  final String subtitle;

  GridItem({
    required this.color,
    required this.images,
    required this.title,
    required this.subtitle,
  });
}