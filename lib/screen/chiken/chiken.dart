// import 'package:flutter/material.dart';
//
//
// class NutritionDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Add your back button functionality here
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 color: Colors.green,
//                 height: 150,
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/food_image.png', // Replace with your image asset
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.grey.shade200,
//                   child: Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           builder: (BuildContext context) {
//                             return NutritionDetails();
//                           },
//                         );
//                       },
//                       child: Text('Show Nutrition Details'),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NutritionDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//         color: Colors.white,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 40,
//             height: 6,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(3),
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               Text(
//                 'Chicken',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Card(
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '85-gram serving of chicken breast contains:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text('• Calories: 122'),
//                   Text('• Protein: 24 grams'),
//                   Text('• Fat: 3 grams'),
//                   Text('• Carbs: 0 grams'),
//                   Text('• Niacin: 51% of the Daily Value (DV)'),
//                   Text('• Selenium: 36% of the DV'),
//                   Text('• Phosphorus: 17% of the DV'),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Chicken not only give the body enough protein, but it also give it the vitamins and minerals it needs. Large amounts of B vitamins are very important for making energy and making red blood cells that are healthy!',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
