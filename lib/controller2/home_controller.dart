import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/profile_patient.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../views2/doctor_profile.dart';
import '../views2/home1.dart';
class Home_Controller extends GetxController {
 String ?p;
  Future<Object> getEmail5() async {
    String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
   var a = await FirebaseFirestore.instance
        .collection("users")
        .where('userid',isEqualTo: _email )
        .get();
   p=a.docs[0]['PatientOrDoctor'];
    return p!;
  }
@override
  void onInit() {
  getEmail5();
  // TODO: implement onInit
    super.onInit();
  }
  static Home_Controller get to => Get.find();
  var currentIndex = 0.obs;
  final pages = <String>['/', '/Ratingscreen', '/p',];
  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/')
      return GetPageRoute(
        settings: settings,
        page: () => HomePage1(),
      );
     if (settings.name == '/p')
     {
         return GetPageRoute(
             settings: settings,
             page: (){
               return
               p=="Patient"? patient_profile():doctor_profile();
             }
         );
     }
    return null;
  }
}