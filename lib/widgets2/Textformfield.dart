import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller2/login_controller.dart';
class TextForm extends StatelessWidget {

  const TextForm({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {


    final LoginController _loginController = Get.put(LoginController());
    return  TextFormField(
      controller: _loginController.emailTextController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: "name",
        hintStyle: TextStyle( fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.normal,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      style: TextStyle( fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.normal,),
      validator: (value) =>
      value!.trim().isEmpty ? 'Email required' : null,
    );
  }
}
