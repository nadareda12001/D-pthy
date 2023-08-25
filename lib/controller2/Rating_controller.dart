import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class RatingController extends GetxController {
  int currentRating = 0;
  final box = GetStorage();

  Future<void> dependencies() async {
  await GetStorage.init();
  Get.put(RatingController());
  }

  // Future<void> initSp() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   currentRating = prefs.getInt('rating') ?? 0;
  // }

  void onInit() { // called whenever we initialize the controller
    super.onInit();
    currentRating = box.read('rating') ?? 0; // initializing current rating from storage or 0 if storage is null
  }
  // void updateAndStoreRating(int rating) {
  //   currentRating = rating;
  //   prefs.setInt('rating', rating); //SharedPreferences way
  //   update(); // triggers a rebuild of the GetBuilder Widget
  // }
  void updateAndStoreRating(int rating) {
    currentRating = rating;
    box.write('rating', rating); // stores to local database
    update(); // triggers a rebuild of the GetBuilder Widget
  }

  Widget buildRatingStar(int index) {
    if (index < currentRating) {
      return Icon(

        size: 30,
        Icons.star,
        color: Colors.yellow,
      );
    } else {
      return Icon(
        size: 30,
        Icons.star,
        color: Colors.grey,
      );
    }
  }}