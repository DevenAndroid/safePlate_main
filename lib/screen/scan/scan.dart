import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SacanScreen extends StatefulWidget {
  const SacanScreen({Key? key}) : super(key: key);
  static var route = "/qrCode";

  @override
  State<StatefulWidget> createState() => _SacanScreenState();
}

class _SacanScreenState extends State<SacanScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .sizeOf(context)
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Color(0xff75D051),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Scan",
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 2, child: _buildQrView(context)),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(

                          onTap: (){

                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,topLeft:Radius.circular(20) )
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.arrow_back_ios,size: 20,),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          Text(
                                            'Chicken',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Card(
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '85-gram serving of chicken breast contains:',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(height: height*0.02),
                                              Text('• Calories: 122',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Protein: 24 grams',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Fat: 3 grams',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Carbs: 0 grams',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Niacin: 51% of the Daily Value (DV)',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Selenium: 36% of the DV',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                              Text('• Phosphorus: 17% of the DV',style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),),
                                              SizedBox(height: height*0.01),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Chicken not only give the body enough protein, but it also give it the vitamins and minerals it needs. Large amounts of B vitamins are very important for making energy and making red blood cells that are healthy!',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,height: 1.5),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                );;
                              },
                            );
                          },
                          child: SvgPicture.asset("assets/icons/scanner_camera.svg")),
                      SizedBox(
                        width: Get.height * 0.1,
                      ),
                      GestureDetector(
                        onTap: (){


                        },
                        child: SvgPicture.asset(
                          "assets/icons/scanner_galler.svg",
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(

                          onPressed: () async {


                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                              context: context,
                              builder: (BuildContext context) {
                                return BottomSheetContent();
                              },
                            );
                          },
                          child: Text("Any Food",style: GoogleFonts.roboto(
                              fontSize:22,
                              fontWeight:FontWeight.w500
                          )),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFBB742), // Background color
                            ),
                            onPressed: ()  {


                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetContent1();
                                },
                              );
                            },

                            child: Text(
                              "Packaged",style: GoogleFonts.roboto(
                                fontSize:22,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 320.0
        : 200.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          overlayColor: Colors.white,
          borderColor: Colors.black,
          borderLength: 60,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 16.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Comprehensive Analysis:',
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title Of The Top 1 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
class BottomSheetContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 16.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Top 3 Health Risks:',
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title Of The Top 1 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title Of The Top 2 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title Of The Top 3 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}