import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home_1_Controller extends GetxController {
  TextEditingController ? NameTextController;
  TextEditingController ? genderTextController;
  TextEditingController ? emailTextController;
  TextEditingController ? SugerlevelTextController;
  TextEditingController ? AgeTextController;
  TextEditingController ? DiabeticTextController;
  TextEditingController ?pressureTextController;


  @override
  void onInit() {
    emailTextController = TextEditingController();
    genderTextController = TextEditingController();
    SugerlevelTextController = TextEditingController();
    NameTextController = TextEditingController();
    AgeTextController = TextEditingController();
    DiabeticTextController = TextEditingController();
    pressureTextController = TextEditingController();


    super.onInit();
  }

  // void apiLogin() async {
  //   Get.dialog(Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false);
  //   Request request = Request(url: urlLogin, body: {
  //     'email': emailTextController.text,
  //     'password': passwordTextController.text
  //   });
  //   request.post().then((value) {
  //     Get.back();
  //     Get.offNamed('/homeView');
  //   }).catchError((onError) {});
  // }

  @override
  void onClose() {
    NameTextController?.dispose();
    AgeTextController?.dispose();
    DiabeticTextController?.dispose();
    pressureTextController?.dispose();
    genderTextController?.dispose();
    SugerlevelTextController?.dispose();
    emailTextController?.dispose();
    super.onClose();
  }
}