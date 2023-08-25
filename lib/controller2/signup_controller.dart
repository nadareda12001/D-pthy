import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  final textController = TextEditingController();

  RxString controllerText = ''.obs;
  //var registration;
  // @override
  // void onInit() {
  //   super.onInit();
  //   textController.addListener(() {
  //     controllerText.value = textController.text;}
  //   }
  TextEditingController ? NameTextController;
  TextEditingController ? phoneTextController;
  TextEditingController ? emailTextController;
  TextEditingController ?passwordTextController;
  TextEditingController ? confirmpassTextController;
  RxBool hidePassword1 = true.obs;
  RxBool hidePassword2 = true.obs;
  @override
  void onInit() {

        super.onInit();
        textController.addListener(() {
          controllerText.value = textController.text;});

    NameTextController = TextEditingController();
    phoneTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmpassTextController = TextEditingController();

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
    phoneTextController?.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
    confirmpassTextController?.dispose();

    super.onClose();
  }
}