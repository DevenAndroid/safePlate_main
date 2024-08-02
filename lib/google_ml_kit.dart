// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:camera/camera.dart';
// // import 'package:mobile_scanner/mobile_scanner.dart';
// //
// // class CameraAndScannerScreen extends StatefulWidget {
// //   @override
// //   _CameraAndScannerScreenState createState() => _CameraAndScannerScreenState();
// // }
// //
// // class _CameraAndScannerScreenState extends State<CameraAndScannerScreen> {
// //   late List<CameraDescription> _cameras;
// //   late CameraController _cameraController;
// //   bool _isCameraInitialized = false;
// //   Timer? _debounceTimer;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeCamera();
// //   }
// //
// //   Future<void> _initializeCamera() async {
// //     try {
// //       _cameras = await availableCameras();
// //       _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
// //       await _cameraController.initialize();
// //       setState(() {
// //         _isCameraInitialized = true;
// //       });
// //     } catch (e) {
// //       print('Error initializing camera: $e');
// //     }
// //   }
// //
// //   void _showSnackBar(String code) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Barcode found! $code')),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Camera and Scanner')),
// //       body: _isCameraInitialized
// //           ? Stack(
// //         children: [
// //           // Camera preview
// //           Positioned.fill(
// //             child: CameraPreview(_cameraController),
// //           ),
// //
// //           Positioned.fill(
// //             child: MobileScanner(
// //               onDetect: (barcodeCapture) {
// //                 final String code = barcodeCapture.barcodes.isNotEmpty
// //                     ? barcodeCapture.barcodes.first.rawValue ?? ''
// //                     : '';
// //
// //                 // Debounce logic
// //                 if (code.isNotEmpty) {
// //                   if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
// //                   _debounceTimer = Timer(const Duration(seconds: 1), () {
// //                     _showSnackBar(code);
// //                   });
// //                 }
// //               },
// //             ),
// //           ),
// //         ],
// //       )
// //           : Center(child: CircularProgressIndicator()),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _cameraController.dispose();
// //     _debounceTimer?.cancel();
// //     super.dispose();
// //   }
// // }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:image_picker/image_picker.dart';
//
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final ImagePicker picker = ImagePicker();
//   String _scanResult = '';
//   String _productName = '';
//   String _productDescription = '';
//   String _productImageUrl = '';
//   File?  capturedImage;
//   String capturedImageBase64 = '';
//   String _productImageBase64 = '';
//   Future<void> _scanBarcode() async {
//     String scanResult;
//     try {
//       scanResult = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666',
//         'Cancel',
//         true,
//         ScanMode.BARCODE,
//       );
//       if (scanResult != '-1') {
//         setState(() {
//           _scanResult = scanResult;
//         });
//         await _fetchProductDetails(scanResult);
//       }
//     } catch (e) {
//       scanResult = 'Failed to get scan result: $e';
//       setState(() {
//         _scanResult = scanResult;
//       });
//     }
//   }
//
//   Future<void> _fetchProductDetails(String barcode) async {
//     final response = await http.get(Uri.parse('https://world.openfoodfacts.org/api/v0/product/$barcode.json'));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == 1) {
//         setState(() {
//           _productName = data['product']['product_name'] ?? 'N/A';
//           _productDescription = data['product']['ingredients_text'] ?? 'N/A';
//           _productImageUrl = data['product']['image_url'] ?? '';
//         });
//         if (_productImageUrl.isNotEmpty) {
//           await _convertImageToBase64(_productImageUrl);
//
//         }
//       } else {
//         setState(() {
//           _productName = 'Product not found';
//           _productDescription = '';
//           _productImageUrl = '';
//         });
//
//       }
//     } else {
//       setState(() {
//         _productName = 'Failed to load product';
//         _productDescription = '';
//         _productImageUrl = '';
//       });
//     }
//   }
//   Future<void> _convertImageToBase64(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode == 200) {
//       final bytes = response.bodyBytes;
//       setState(() {
//         _productImageBase64 = base64Encode(bytes);
//         print(_productImageBase64);
//       });
//     } else {
//       setState(() {
//         _productImageBase64 = 'Failed to load image';
//       });
//     }
//   }
//   Future<void> _captureImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       final bytes = await pickedFile.readAsBytes();
//       setState(() {
//         capturedImage = File(pickedFile.path);
//         capturedImageBase64 = base64Encode(bytes);
//         capturedImage = File(pickedFile.path);
//         print("object${capturedImageBase64.toString()}");
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Product Scanner'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: _scanBarcode,
//                 child: Text('Scan Barcode/QR Code'),
//               ),
//
//               ElevatedButton(
//                 onPressed: _captureImage,
//                 child: Text('Capture Product Image'),
//               ),
//
//               SizedBox(height: 20),
//               Text(
//                 'Scan Result:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 _scanResult,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Product Name:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 _productName,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               const Text(
//                 'Product Description:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 _productDescription,
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               if (_productImageUrl.isNotEmpty)
//                 Image.network(
//                   _productImageUrl,
//                   width: 200,
//                   height: 200,
//                 )
//               else
//                 Text('No image available.'),
//               if (_productImageUrl.isNotEmpty)
//                 Column(
//                   children: [
//
//                     SizedBox(height: 10),
//                     Text(
//                       'Base64 Image String:',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       _productImageBase64,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 )
//               else
//                 Text('No image available.'),
//               if (capturedImage != null)
//                 Column(
//                   children: [
//                     Image.file(
//                       capturedImage!,
//                       width: 200,
//                       height: 200,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Captured Image Base64 String:',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//
//                       capturedImageBase64,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 )
//               else
//                 Text('No image captured.'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CaptureImageScreen extends StatefulWidget {
  @override
  _CaptureImageScreenState createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  final ImagePicker picker = ImagePicker();
  File? capturedImage;
  String? capturedImageBase64;

  Future<void> _captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // if (pickedFile != null) {
    //   final bytes = await pickedFile.readAsBytes();
    //   setState(() {
    //     capturedImage = File(pickedFile.path);
    //     capturedImageBase64 = base64Encode(bytes);
    //     print("Base64 Image: $capturedImageBase64");
    //   });
    //
    //   // Send image to Gemini API
    //   await _sendImageToGeminiApi(capturedImageBase64!);
    // }
  }
  final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: 'AIzaSyCN8dhcaho97nuCPLH8jpSwHnw_B2CpqqA',
      generationConfig: GenerationConfig(maxOutputTokens: 100));

  Future<void> _sendImageToGeminiApi(String base64Image) async {
    final apiKey = Platform.environment['AIzaSyCiDGfFN-tCfYrF52weQZ0Lbv8_UcmNbA4'];
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      // exit(1);
    }
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);
    final chat = model.startChat(history: [
      Content.text('Hello, I have 2 dogs in my house.'),
      Content.model([TextPart('Great to meet you. What would you like to know?')])
    ]);
    var content = Content.text('How many paws are in my house?');
    var response = await chat.sendMessage(content);
    print(response.text);
    // final url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyCuDv9bqBVT8vOhYBwSyTJVr9uveby9xRs';
    // final headers = {
    //   'Content-Type': 'application/json',
    // };
    // final body = jsonEncode({'image': base64Image});
    //
    // final response = await http.post(
    //   Uri.parse(url),
    //   headers: headers,
    //   body: body,
    // );
    //
    // if (response.statusCode == 200) {
    //   // Handle successful response
    //   print('Image uploaded successfully: ${response.body}');
    // } else {
    //   // Handle error response
    //   print('Failed to upload image: ${response.statusCode}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            capturedImage != null
                ? Image.file(capturedImage!)
                : Text('No image captured.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CaptureImageScreen(),
  ));
}
