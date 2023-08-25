import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';


class ProfilePageController extends GetxController {
  final box2 = GetStorage();
  String? selectedGender;
  final List<String> gender = ["Doctor", "Patient"];

  String? select;
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.put(ProfilePageController(),permanent: true);
  }
  void onInit() {
    super.onInit();
    box2.read('value');
  }
  void onClickRadioButton(value) {
    print(value);
    select = value;
    box2.write('value', value);
    update();
  }
}