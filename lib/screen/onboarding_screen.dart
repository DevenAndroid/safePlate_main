import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/onbording_model.dart';
import '../repo/onboarding_repo.dart';
import '../widget/helper.dart';
import 'login_screen.dart';
import 'onboard_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static var route = "/onBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  final RxInt _pageIndex = 0.obs;

  // Rx<RxStatus> statusOfOnBoarding = RxStatus.empty().obs;
  // Rx<BoardingModel> dataOnBoarding = BoardingModel().obs;
  // getDataOnBording() {
  //   onBoardingRepo().then((value) {
  //     log("response.body..... ${value}");
  //     dataOnBoarding.value = value;
  //     if (value.success == true) {
  //       log("User data: ${dataOnBoarding.value.data.toString()}");
  //       print('Data success: ${value.message.toString()}');
  //     } else {
  //       showToast(value.message);
  //       print('Data error: ${value.message.toString()}');
  //       statusOfOnBoarding.value = RxStatus.error();
  //     }
  //   }).catchError((error) {
  //     log("Error: $error");
  //     showToast("An error occurred");
  //     statusOfOnBoarding.value = RxStatus.error();
  //   });
  // }

  @override
  void initState() {
    super.initState();
   // getDataOnBording();
    _pageController = PageController(initialPage: 0);

  }



  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if(kIsWeb){

    }
    return


      Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body:

       // dataOnBoarding.value.success == true ?
        Stack(
      children: [
        PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
            //dataOnBoarding.value.data!.onboarding!.length,
            OnBoardData.length,
            controller: _pageController,
            pageSnapping: true,
            onPageChanged: (index) {
              setState(() {
                _pageIndex.value = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(children: [
                Image.asset(
                 // dataOnBoarding.value.data!.onboarding![index].dataa!.icon.toString(),
                  height: height * .7,
                  width: width,
                  // dataOnBoarding.value.data!.onboarding1!.icon.toString(),
                 OnBoardData[index].image.toString(),
                  fit: BoxFit.cover,
                ),
              ]);
            }),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:310,
                                  child: Text(
                                  //  dataOnBoarding.value.data!.onboarding![index].dataa!.headerText.toString(),
                                    OnBoardData[index].title.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                      color:Color(0xff283841)
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:310,
                                  child: Text(
                                    //dataOnBoarding.value.data!.onboarding![index].dataa!.caption.toString(),
                                    OnBoardData[index].description.toString(),
                                    textAlign: TextAlign.center,
                                    style:  GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff3A3E3D),
                                        height: 1.6,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                               // dataOnBoarding.value.data!.onboarding!.length,
                                 OnBoardData.length,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: CustomIndicator(
                                        isActive: index == _pageIndex.value,
                                      ),
                                    )),
                          ],
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        Get.offAllNamed(LoginScreen.route);
                      },
                      child:  Text(
                        "Skip",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff99A6A3),
                            fontSize: 16),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          if (_pageIndex.value == 2) {
                            Get.offAllNamed(LoginScreen.route);
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              _pageIndex.value == 2
                                  ? "Get Started  "
                                  : "Next  ",
                              style:  GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff99A6A3),
                                  fontSize: 16),
                            ),
                           Image(image:  AssetImage("assets/icons/Arrow.png"),
                             color: Color(0xff99A6A3),
                             height: 20,)
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    )
// :const SizedBox(child: CircularProgressIndicator(),)

      );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool isActive;

  const CustomIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: isActive ? 20 : 12,
          height: 12,
          decoration: BoxDecoration(
              color: isActive ? Color(0xff75D051) : Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
        ));
  }
}