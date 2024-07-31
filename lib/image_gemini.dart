// //
// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:http/http.dart' as http;
// //
// // class ImageChat extends StatefulWidget {
// //   const ImageChat({super.key});
// //
// //   @override
// //   State<ImageChat> createState() => _ImageChatState();
// // }
// //
// // class _ImageChatState extends State<ImageChat> {
// //
// //   XFile? pickedImage;
// //   String mytext = '';
// //   bool scanning=false;
// //
// //   TextEditingController prompt=TextEditingController();
// //
// //   final ImagePicker _imagePicker = ImagePicker();
// //
// //   final apiUrl='https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key={AIzaSyCN8dhcaho97nuCPLH8jpSwHnw_B2CpqqA}';
// //
// //   final header={
// //     'Content-Type': 'application/json',
// //   };
// //
// //
// //   getImage(ImageSource ourSource) async {
// //     XFile? result = await _imagePicker.pickImage(source: ourSource);
// //
// //     if (result != null) {
// //       setState(() {
// //         pickedImage = result;
// //       });
// //     }
// //   }
// //
// //   getdata(image,promptValue)async{
// //
// //     setState(() {
// //       scanning=true;
// //       mytext='abc';
// //     });
// //
// //     try{
// //
// //       List<int> imageBytes = File(image.path).readAsBytesSync();
// //       String base64File = base64.encode(imageBytes);
// //
// //       final data={
// //         "contents": [
// //           {
// //             "parts": [
// //
// //               {"text":promptValue},
// //
// //               {
// //                 "inlineData": {
// //                   "mimeType": "image/jpeg",
// //                   "data": base64File,
// //                 }
// //               }
// //             ]
// //           }
// //         ],
// //       };
// //
// //       await http.post(Uri.parse(apiUrl),headers: header,body: jsonEncode(data)).then((response){
// //
// //         if (response.statusCode == 200) {
// //           var result = jsonDecode(response.body);
// //           mytext = result['candidates'][0]['content']['parts'][0]['text'];
// //         } else if (response.statusCode == 400) {
// //           mytext = 'Bad Request: ${response.statusCode}';
// //         } else {
// //           mytext = 'Response status: ${response.statusCode}';
// //         }
// //
// //
// //       }).catchError((error){
// //         print('Error occored ${error}');
// //       });
// //     }catch(e){
// //       print('Error occured ${e}');
// //     }
// //
// //     scanning=false;
// //
// //     setState(() {});
// //
// //   }
// //
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //
// //       appBar: AppBar(
// //
// //         title: const Text('Google Gemini',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
// //
// //         backgroundColor: Colors.black,
// //
// //         actions: [
// //           IconButton(onPressed: (){
// //
// //             getImage(ImageSource.gallery);
// //
// //           }, icon: Icon(Icons.photo,color: Colors.white,)),SizedBox(width: 10,)],
// //       ),
// //
// //
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: ListView(
// //           children: [
// //
// //             pickedImage == null
// //                 ? Container(
// //                 height: 340,
// //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
// //                   border: Border.all(color: Colors.black,width: 2.0,),),
// //                 child: Center(child: Text('No Image Selected',style: TextStyle(fontSize: 22),),))
// //                 :
// //             Container(height:340,child: Center(child: Image.file(File(pickedImage!.path),height: 400,))),
// //
// //
// //             SizedBox(height: 20),
// //
// //             TextField(
// //               controller: prompt,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: BorderSide(color: Colors.black,width: 2.0,),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: BorderSide(color: Colors.black,width: 2.0,),
// //                 ),
// //                 prefixIcon: Icon(
// //                   Icons.pending_sharp,
// //                   color: Colors.black,
// //                 ),
// //                 hintText: 'Enter your prompt here',
// //               ),
// //             ),
// //             SizedBox(height: 20,),
// //
// //             ElevatedButton.icon(
// //               onPressed: (){
// //                 getdata(pickedImage,prompt.text);
// //               },
// //               icon: Icon(Icons.generating_tokens_rounded,color: Colors.white,),
// //               label: Padding(
// //                 padding: const EdgeInsets.all(10),
// //                 child: Text('Generate Answer',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
// //               ),
// //               style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),
// //             ),
// //
// //             SizedBox(height: 30),
// //
// //             scanning?
// //             Padding(
// //               padding: const EdgeInsets.only(top: 60),
// //               child: Center(child: SpinKitThreeBounce(color: Colors.black,size: 20,)),
// //             ):
// //             Text(mytext,textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
// //
// //
// //           ],
// //         ),
// //       ),
// //
// //     );
// //
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class ScanAndSendImage extends StatefulWidget {
//   @override
//   _ScanAndSendImageState createState() => _ScanAndSendImageState();
// }
//
// class _ScanAndSendImageState extends State<ScanAndSendImage> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   String? _responseText;
//
//   Future<void> _scanImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//
//       await _sendImageToGoogleGemini(_image!);
//     }
//   }
//
//   Future<void> _sendImageToGoogleGemini(File image) async {
//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('https://api.gemini.com/v1/image-analysis'),
//     );
//
//     request.files.add(await http.MultipartFile.fromPath('file', image.path));
//     request.headers.addAll({'Authorization': 'Bearer AIzaSyCiDGfFN-tCfYrF52weQZ0Lbv8_UcmNbA4'});
//
//     final response = await request.send();
//
//     if (response.statusCode == 200) {
//       final responseBody = await response.stream.bytesToString();
//       final result = jsonDecode(responseBody);
//
//       setState(() {
//         _responseText = result['candidates'][0]['content']['parts'][0]['text'];
//       });
//     } else if (response.statusCode == 400) {
//       setState(() {
//         _responseText = 'Bad Request: ${response.statusCode}';
//       });
//     } else if (response.statusCode == 404) {
//       setState(() {
//         _responseText = 'Not Found: ${response.statusCode}';
//       });
//     } else {
//       setState(() {
//         _responseText = 'Response status: ${response.statusCode}';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan and Send Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _scanImage,
//               child: Text('Scan Image'),
//             ),
//             SizedBox(height: 16),
//             _responseText == null
//                 ? Container()
//                 : Text(
//               'Response: $_responseText',
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ScanAndSendImage(),
//   ));
// }
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageToBase64(),
//     );
//   }
// }
//
// class ImageToBase64 extends StatefulWidget {
//   @override
//   _ImageToBase64State createState() => _ImageToBase64State();
// }
//
// class _ImageToBase64State extends State<ImageToBase64> {
//   File? _image;
//   String? _base64String;
//   // if (pickedFile != null) {
//   // final bytes = await File(pickedFile.path).readAsBytes();
//   // setState(() {
//   // _image = File(pickedFile.path);
//   // _base64String = base64Encode(bytes);
//   // });
//   // }
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// if(pickedFile!=null){
//   final bytes = await File(pickedFile.path).readAsBytes();
//   setState(() {
//     _image = File(pickedFile.path);
//     _base64String = base64Encode(bytes);
//   });
// }
// // if(picked
// //   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image to Base64'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image != null
//                 ? Image.file(_image!)
//                 : Text('No image selected.'),
//             SizedBox(height: 20),
//             _base64String != null
//                 ? Text('Base64 String: $_base64String')
//                 : Container(),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker picker = ImagePicker();
  String _scanResult = '';
  String _productName = '';
  String _productDescription = '';
  String _productImageUrl = '';
  File?  capturedImage;
  String capturedImageBase64 = '';
  String _productImageBase64 = '';
  Future<void> _scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      if (scanResult != '-1') {
        setState(() {
          _scanResult = scanResult;
        });
        await _fetchProductDetails(scanResult);
      }
    } catch (e) {
      scanResult = 'Failed to get scan result: $e';
      setState(() {
        _scanResult = scanResult;
      });
    }
  }

  Future<void> _fetchProductDetails(String barcode) async {
    final response = await http.get(Uri.parse('https://world.openfoodfacts.org/api/v0/product/$barcode.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 1) {
        setState(() {
          _productName = data['product']['product_name'] ?? 'N/A';
          _productDescription = data['product']['ingredients_text'] ?? 'N/A';
          _productImageUrl = data['product']['image_url'] ?? '';
        });
        if (_productImageUrl.isNotEmpty) {
          await _convertImageToBase64(_productImageUrl);

        }
      } else {
        setState(() {
          _productName = 'Product not found';
          _productDescription = '';
          _productImageUrl = '';
        });

      }
    } else {
      setState(() {
        _productName = 'Failed to load product';
        _productDescription = '';
        _productImageUrl = '';
      });
    }
  }
  Future<void> _convertImageToBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      setState(() {
        _productImageBase64 = base64Encode(bytes);
        print(_productImageBase64);
      });
    } else {
      setState(() {
        _productImageBase64 = 'Failed to load image';
      });
    }
  }
  Future<void> _captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        capturedImage = File(pickedFile.path);
        capturedImageBase64 = base64Encode(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Scanner'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _scanBarcode,
                child: Text('Scan Barcode/QR Code'),
              ),

              ElevatedButton(
                onPressed: _captureImage,
                child: Text('Capture Product Image'),
              ),

              SizedBox(height: 20),
              Text(
                'Scan Result:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _scanResult,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Product Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _productName,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Product Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _productDescription,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              if (_productImageUrl.isNotEmpty)
                Image.network(
                  _productImageUrl,
                  width: 200,
                  height: 200,
                )
              else
                Text('No image available.'),
              if (_productImageUrl.isNotEmpty)
                Column(
                  children: [

                    SizedBox(height: 10),
                    Text(
                      'Base64 Image String:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _productImageBase64,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              else
                Text('No image available.'),
              if (capturedImage != null)
                Column(
                  children: [
                    Image.file(
                      capturedImage!,
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Captured Image Base64 String:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      capturedImageBase64,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              else
                Text('No image captured.'),
            ],
          ),
        ),
      ),
    );
  }
}
