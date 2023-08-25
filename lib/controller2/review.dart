// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rating_dialog/rating_dialog.dart';
//
// class HomeController extends GetxController {
//   var rating = 0.0.obs;
//   var comment = ''.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {}
//   showRatingDialog() {
//     Get.dialog(RatingDialog(
//       starColor: Colors.amber,
//       title: Text('Rating Dialog'),
//       message: Text(
//           'Tap a star to set your rating. Add more description here if you want.'),
//       image: Image.asset(
//         "image/logo.jpg",
//         height: 100,
//       ),
//       submitButtonText: 'Submit',
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//         rating.value = response.rating;
//         comment.value = response.comment;
//       },
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';


class ProfilePageController extends GetxController {


  final List<String> gender = ["Doctor", "Patient"];

  late String select;
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.put(ProfilePageController(),permanent: true);
  }


}