import 'package:Safeplate/controller/bottomnavbar_contrller.dart';
import 'package:Safeplate/screen/BottomNavBar/home.dart';
import 'package:Safeplate/screen/BottomNavBar/profile_screen.dart';
import 'package:Safeplate/screen/scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static var route = "/bottonNavBar";

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final bottomController = Get.put(BottomNavBarController());

  @override
  void initState() {
    super.initState();

    // locationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      SacanScreen(),
      ProfileScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(BottomNavbar.route);
        return false;
      },
      child: Obx(() {
        return Stack(
          children: [
            Scaffold(
              body: pages.elementAt(bottomController.pageIndex.value),
              extendBody: true,
              // extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              bottomNavigationBar: buildMyNavBar(context),
            ),
            Positioned(
              bottom: 20.0,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: FloatingActionButton(


                onPressed: () {
                  bottomController.updateIndexValue(1);
                },
           child: SvgPicture.asset("assets/icons/Container.svg"),
              ),
            ),
          ],
        );
      }),
    );
  }

  buildMyNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          width: double.maxFinite,
          decoration:  BoxDecoration(
            borderRadius:  BorderRadius.vertical(top: Radius.circular(24.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffC5DCBC).withOpacity(.52),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MaterialButton(
                        onPressed: () {
                          bottomController.updateIndexValue(0);
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            bottomController.pageIndex.value == 0
                                ? Image.asset(
                              "assets/icons/home.png",
                              color: Color(0xff75D051),
                            )
                                : Image.asset(
                              "assets/icons/home.png",
                              color: Color(0xff484C52),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            bottomController.pageIndex.value == 0
                                ?  Text(
                              "Home",
                              style: GoogleFonts.roboto(
                                  color: Color(0xff75D051),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                                :  Text(
                              "Home",
                              style: GoogleFonts.roboto(
                                  color: Color(0xff484C52),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: MaterialButton(
                        onPressed: () {
                          bottomController.updateIndexValue(2);
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            bottomController.pageIndex.value == 2
                                ? Image.asset(
                           "assets/icons/user.png",
                              color: Color(0xff75D051),
                            )
                                : Image.asset(
                              "assets/icons/user.png",
                              color: Color(0xff484C52),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            bottomController.pageIndex.value == 2
                                ?  Text(
                              "Profile",
                              style: GoogleFonts.roboto(
                                  color: Color(0xff75D051),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                                :  Text(
                              "Profile",
                              style: GoogleFonts.roboto(
                                  color: Color(0xff484C52),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
