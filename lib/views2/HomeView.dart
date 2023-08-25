// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:reviews_slider/reviews_slider.dart';
//
// import '../controller2/review.dart';
//
//
// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Review Slider'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'How is the GetX tutorial on Ripples Code Channel?',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ReviewSlider(
//                 onChange: (int value) {
//                   controller.selectedValue.value = value;
//                 },
//                 initialValue: 1,
//                 optionStyle: TextStyle(
//                   color: Colors.deepPurple,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 options: [],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//
//               Obx(()=> Text(
//                 controller.selectedValue.value.toString() == "0"
//                     ? "Terrible"
//                     : controller.selectedValue.value.toString() == "1"
//                     ? "Bad"
//                     : controller.selectedValue.value.toString() == "2"
//                     ? "Okay"
//                     : controller.selectedValue.value.toString() == "3"
//                     ? "Good"
//                     : controller.selectedValue.value.toString() ==
//                     "4"
//                     ? "Great"
//                     : "Terrible",
//                 style: TextStyle(fontSize: 20),
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }