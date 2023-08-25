import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller2/radio_controller.dart';
final ProfilePageController _profilePageController = Get.put(ProfilePageController());
Row addRadioButton(int btnIndex, String title) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      GetBuilder<ProfilePageController>(
        builder: (_) => Radio(

            activeColor: Colors.blueGrey,
            value: _profilePageController.gender[btnIndex],
            groupValue: _profilePageController.box2.read('value'),
            onChanged: (value) =>
                _profilePageController.onClickRadioButton(value)),
      ),
      Text(title,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),)
    ],
  );
}