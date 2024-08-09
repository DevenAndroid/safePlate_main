// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class SacanScreen extends StatefulWidget {
//   const SacanScreen({Key? key}) : super(key: key);
//   static var route = "/qrCode";
//
//   @override
//   State<StatefulWidget> createState() => _SacanScreenState();
// }
//
// class _SacanScreenState extends State<SacanScreen> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery
//         .sizeOf(context)
//         .height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 0,
//         titleSpacing: 0,
//         backgroundColor: Color(0xff75D051),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           "Scan",
//           style: GoogleFonts.roboto(
//               fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 2, child: _buildQrView(context)),
//           Expanded(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//
//                           onTap: (){
//
//                             // showModalBottomSheet(
//                             //   context: context,
//                             //   backgroundColor: Colors.transparent,
//                             //   isScrollControlled: true,
//                             //   shape: OutlineInputBorder(
//                             //       borderSide: BorderSide(color: Colors.transparent),
//                             //       borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,topLeft:Radius.circular(20) )
//                             //   ),
//                             //   builder: (BuildContext context) {
//                             //     return Container(
//                             //       padding: EdgeInsets.all(16),
//                             //       decoration: BoxDecoration(
//                             //         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//                             //         color: Colors.white,
//                             //       ),
//                             //       child: Column(
//                             //         mainAxisSize: MainAxisSize.min,
//                             //         children: [
//                             //           Container(
//                             //             width: 40,
//                             //             height: 6,
//                             //             decoration: BoxDecoration(
//                             //               borderRadius: BorderRadius.circular(3),
//                             //               color: Colors.grey,
//                             //             ),
//                             //           ),
//                             //           SizedBox(height: 8),
//                             //           Row(
//                             //             children: [
//                             //               IconButton(
//                             //                 icon: Icon(Icons.arrow_back_ios,size: 20,),
//                             //                 onPressed: () {
//                             //                   Get.back();
//                             //                 },
//                             //               ),
//                             //               Text(
//                             //                 'Chicken',
//                             //                 style: TextStyle(
//                             //                   fontSize: 18,
//                             //                   fontWeight: FontWeight.bold,
//                             //                 ),
//                             //               ),
//                             //             ],
//                             //           ),
//                             //           SizedBox(height: 16),
//                             //           Card(
//                             //             shape: OutlineInputBorder(
//                             //                 borderRadius: BorderRadius.circular(8)
//                             //             ),
//                             //             child: Padding(
//                             //               padding: const EdgeInsets.all(18),
//                             //               child: Column(
//                             //                 crossAxisAlignment: CrossAxisAlignment.start,
//                             //                 children: [
//                             //                   Text(
//                             //                     '85-gram serving of chicken breast contains:',
//                             //                     style: GoogleFonts.roboto(
//                             //                         fontSize: 16,
//                             //                         fontWeight: FontWeight.w400,
//                             //                         color: Colors.black),
//                             //                   ),
//                             //                   SizedBox(height: height*0.02),
//                             //                   Text('• Calories: 122',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Protein: 24 grams',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Fat: 3 grams',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Carbs: 0 grams',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Niacin: 51% of the Daily Value (DV)',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Selenium: 36% of the DV',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                   Text('• Phosphorus: 17% of the DV',style: GoogleFonts.roboto(
//                             //                       fontSize: 16,
//                             //                       fontWeight: FontWeight.w400,
//                             //                       color: Colors.black),),
//                             //                   SizedBox(height: height*0.01),
//                             //                 ],
//                             //               ),
//                             //             ),
//                             //           ),
//                             //           SizedBox(height: 16),
//                             //           Text(
//                             //             'Chicken not only give the body enough protein, but it also give it the vitamins and minerals it needs. Large amounts of B vitamins are very important for making energy and making red blood cells that are healthy!',
//                             //             style: GoogleFonts.roboto(
//                             //                 fontSize: 14,
//                             //                 fontWeight: FontWeight.w400,
//                             //                 color: Colors.black,height: 1.5),
//                             //             textAlign: TextAlign.start,
//                             //           ),
//                             //         ],
//                             //       ),
//                             //     );;
//                             //   },
//                             // );
//                           },
//                           child: SvgPicture.asset("assets/icons/scanner_camera.svg")),
//                       SizedBox(
//                         width: Get.height * 0.1,
//                       ),
//                       GestureDetector(
//                         onTap: (){
//
//
//                         },
//                         child: SvgPicture.asset(
//                           "assets/icons/scanner_galler.svg",
//                           height: 50,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: SizedBox(
//                         height: 50,
//                         width: 150,
//                         child: ElevatedButton(
//
//                           onPressed: () async {
//
//
//                             showModalBottomSheet(
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return BottomSheetContent();
//                               },
//                             );
//                           },
//                           child: Text("Any Food",style: GoogleFonts.roboto(
//                               fontSize:22,
//                               fontWeight:FontWeight.w500
//                           )),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: SizedBox(
//                         height: 50,
//                         width: 150,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xffFBB742), // Background color
//                             ),
//                             onPressed: ()  {
//
//
//                               showModalBottomSheet(
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return BottomSheetContent1();
//                                 },
//                               );
//                             },
//
//                             child: Text(
//                               "Packaged",style: GoogleFonts.roboto(
//                                 fontSize:22,
//                                 fontWeight:FontWeight.w500,
//                                 color:Colors.white
//                             )
//                             )),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 320.0
//         : 200.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           overlayColor: Colors.white,
//           borderColor: Colors.black,
//           borderLength: 60,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
//
//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
// class BottomSheetContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: Icon(Icons.keyboard_arrow_down),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Comprehensive Analysis:',
//               style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Title Of The Top 1 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
//                 Icon(Icons.arrow_forward),
//               ],
//             ),
//           ),
//           SizedBox(height: 30,)
//         ],
//       ),
//     );
//   }
// }
// class BottomSheetContent1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: Icon(Icons.keyboard_arrow_down),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Top 3 Health Risks:',
//               style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Title Of The Top 1 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
//                 Icon(Icons.arrow_forward),
//               ],
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Title Of The Top 2 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
//                 Icon(Icons.arrow_forward),
//               ],
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Title Of The Top 3 Risk',   style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),),
//                 Icon(Icons.arrow_forward),
//               ],
//             ),
//           ),
//           SizedBox(height: 40,)
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:barcode_scan2/barcode_scan2.dart'; // Import the barcode scanning package
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/profile_controller.dart';

class SacanScreen extends StatefulWidget {
  String? name;
  String? health;
  String? age;
  String? weight;

  static var route = "/qrCode";

  SacanScreen({super.key, this.name, this.age, this.health, this.weight});

  @override
  State<SacanScreen> createState() => _SacanScreenState();
}

class _SacanScreenState extends State<SacanScreen> {
  XFile? pickedImage;
  String mytext = '';
  bool scanning = false;
  String barcodeResult = '';

  final profileController = Get.put(ProfileController());
  TextEditingController prompt = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  final apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyCiDGfFN-tCfYrF52weQZ0Lbv8_UcmNbA4';

  final header = {
    'Content-Type': 'application/json',
  };

  getImage(ImageSource ourSource) async {
    XFile? result = await _imagePicker.pickImage(source: ourSource);

    if (result != null) {
      setState(() {
        pickedImage = result;
      });
      if (prompt.text.isNotEmpty) {
        getData(result, prompt.text);
      } else {
        String profilePrompt =
            'name:${widget.name.toString()},health issue:${widget.health.toString()},age:${widget.age.toString()},weight:${widget.weight.toString()} I need to know whether this food is right for me or not according to my details. If not, then why?';
        getData(result, profilePrompt);
      }
    }
  }

  Future<String> convertImageToBase64(XFile image) async {
    try {
      final imageBytes = await File(image.path).readAsBytes();
      final base64Image = base64Encode(imageBytes);
      print("object>>>>>>>>>${base64Image}");
      return base64Image;
    } catch (e) {
      print("Error converting image to Base64: ${e.toString()}");
      return '';
    }
  }

  getData(XFile image, String promptValue) async {
    setState(() {
      scanning = true;
      mytext = '';
    });

    try {
      String base64File = await convertImageToBase64(image);

      final data = {
        "contents": [
          {
            "parts": [
              {"text": promptValue},
              {
                "inlineData": {
                  "mimeType": "image/jpeg",
                  "data": base64File,
                }
              }
            ]
          }
        ],
      };

      final response = await http.post(Uri.parse(apiUrl), headers: header, body: jsonEncode(data));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        setState(() {
          mytext = result['candidates'][0]['content']['parts'][0]['text'];
        });
      } else {
        setState(() {
          mytext = 'Failed to fetch data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        mytext = 'Error occurred: ${e.toString()}';
      });
    } finally {
      setState(() {
        scanning = false;
      });
    }
  }

  scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        barcodeResult = result.rawContent;
      });
      String base64Barcode = base64Encode(utf8.encode(barcodeResult));
      getBarcodeData(base64Barcode);
    } catch (e) {
      setState(() {
        barcodeResult = 'Error occurred: ${e.toString()}';
      });
    }
  }

  getBarcodeData(String base64Barcode) async {
    setState(() {
      scanning = true;
      mytext = 'Fetching data for barcode...';
    });

    final data = {
      "contents": [
        {
          "parts": [
            {"text": 'Barcode: $base64Barcode'},
            {
              "text":
                  'name:${widget.name.toString()},health issue:${widget.health.toString()},age:${widget.age.toString()},weight:${widget.weight.toString()}'
            }
          ]
        }
      ],
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: header, body: jsonEncode(data));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        setState(() {
          mytext = result['candidates'][0]['content']['parts'][0]['text'];
        });
      } else {
        setState(() {
          mytext = 'Failed to fetch data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        mytext = 'Error occurred: ${e.toString()}';
      });
    } finally {
      setState(() {
        scanning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
    print("object>>>${widget.name.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: [
          Expanded(flex: 2,child: scanBarcode()),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                                getImage( ImageSource.gallery);
                              },

                              child: SvgPicture.asset("assets/icons/scanner_camera.svg")),
                          SizedBox(
                            width: Get.height * 0.1,
                          ),
                          GestureDetector(
                            onTap: () {
                              getImage( ImageSource.camera);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/scanner_galler.svg",
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      scanning
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.black,
                                  size: 50.0,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                mytext,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



