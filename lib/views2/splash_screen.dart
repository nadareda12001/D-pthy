import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller2/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  late SplashController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.find<SplashController>();
    return  Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 150,
              child: Image(
                image: AssetImage(
                  "images/logo.png",
                ),
                height: 150,
              )),
        ),
      ),
    );}}
