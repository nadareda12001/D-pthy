// import 'package:flutter_rating_stars/flutter_rating_stars.dart';
// import 'package:flutter/material.dart';
//
// class Rating_Row extends StatefulWidget {
//   const Rating_Row({Key? key}) : super(key: key);
//
//   @override
//   State<Rating_Row> createState() => _Rating_RowState();
// }
//
// class _Rating_RowState extends State<Rating_Row> {
//   double value = 3.5;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RatingStars(
//         value: value,
//         onValueChanged: (v) {
//
//           setState(() {
//             value = v;
//           });
//         },
//         starBuilder: (index, color) => Icon(
//           Icons.ac_unit_outlined,
//           color: color,
//         ),
//         starCount: 5,
//         starSize: 20,
//         valueLabelColor: const Color(0xff9b9b9b),
//         valueLabelTextStyle: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//             fontStyle: FontStyle.normal,
//             fontSize: 12.0),
//         valueLabelRadius: 10,
//         maxValue: 5,
//         starSpacing: 2,
//         maxValueVisibility: true,
//         valueLabelVisibility: true,
//         animationDuration: Duration(milliseconds: 1000),
//         valueLabelPadding:
//         const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
//         valueLabelMargin: const EdgeInsets.only(right: 8),
//         starOffColor: const Color(0xffe7e8ea),
//         starColor: Colors.yellow,
//       ),
//     );
//   }
// }

// class _MyAppState extends State<MyApp> {
//   double value = 3.5;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Example'),
//         ),
//         body: Center(
//           child: RatingStars(
//             value: value,
//             onValueChanged: (v) {
//               //
//               setState(() {
//                 value = v;
//               });
//             },
//             starBuilder: (index, color) => Icon(
//               Icons.ac_unit_outlined,
//               color: color,
//             ),
//             starCount: 5,
//             starSize: 20,
//             valueLabelColor: const Color(0xff9b9b9b),
//             valueLabelTextStyle: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 fontSize: 12.0),
//             valueLabelRadius: 10,
//             maxValue: 5,
//             starSpacing: 2,
//             maxValueVisibility: true,
//             valueLabelVisibility: true,
//             animationDuration: Duration(milliseconds: 1000),
//             valueLabelPadding:
//             const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
//             valueLabelMargin: const EdgeInsets.only(right: 8),
//             starOffColor: const Color(0xffe7e8ea),
//             starColor: Colors.yellow,
//           ),
//         ),
//       ),
//      );
//    }
// }