// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
// class cameraController extends GetxController {
//   //
//   // File? pickedImageFile;
//   // void _pickImage() async {
//   // final picker = ImagePicker();
//   // final pickedImage = await picker.pickImage(source: ImageSource.camera);
//   // pickedImageFile = File(pickedImage!.path);
//   // update();
//   // }
//   // void Function() get pickImage => _pickImage;
//
//    File? image;
//    final imagepicker = ImagePicker();
//    uploadImage()async{
//      // ignore: deprecated_member_use
//      var pickedImage= await imagepicker.getImage(source: ImageSource.camera);
//      if(pickedImage!=null){
//        image=File(pickedImage.path);
//      }else{}
//
//
//    }
// }


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views2/camera.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../views2/home.dart';
import '../views2/profile_patient.dart';
class CameraController extends GetxController {
  final box4 = GetStorage();
  var imagePath2 = "";
  var isImagePathSet2 = false.obs;
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.put(CameraController(),permanent: true);
  }
  void onInit() {

    super.onInit();
    // box4.read('image5');
    // box4.read('set5');

  }

  void setImagePath1(String path1) {
    imagePath2= path1;
    isImagePathSet2.value = true;

    update();
  }
}
// File? imageFile;
// ImagePicker imagePicker = ImagePicker();
// Future<void> takePhoto(ImageSource source, BuildContext context) async {
//   final pickedImage =
//   await imagePicker.pickImage(source: source, imageQuality: 100);
//
//   imageFile = File(pickedImage!.path);
//
//   imagePickerController.setImagePath(imageFile!.path);
//   Navigator.pop(context);
// }
