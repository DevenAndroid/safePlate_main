import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static var route = "/notificationScreen";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Color(0xff75D051),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,color: Colors.white,
          ),
        ),
        title: Text("Notification", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),

      ),
body: Padding(
  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom,top: 30),
  child: ListView.builder(
    // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 7,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 14),
          child: GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF04666E).withOpacity(0.14),
                      spreadRadius: 1.0,
                      blurRadius: 20.0,
                      offset: const Offset(3.0, 3.0))
                ],
              ),
              width: Get.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               SizedBox(width: 8,),
                  Container(
                    height: 60,
                    width: 3,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xff7ED957),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff7ED957),
                      child: Text(
                        'J',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 6),
                          child: Text(
                          "21 March 2024",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 2),
                          child: Text(
                           "Jackeline post new video"
                                .toString()
                                .capitalize
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
),

    );
  }
}
