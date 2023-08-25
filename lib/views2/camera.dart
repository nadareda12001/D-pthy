import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import'dart:io';

import '../controller2/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({Key? key}) : super(key: key);
  @override


  final CameraController cameraController = Get.find<CameraController >();


    @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
        children: [
          GetBuilder<CameraController>(builder: (cameraController)=>CircleAvatar(
            radius: 70,
            backgroundImage: cameraController.isImagePathSet2.value== true
                ? FileImage(File(cameraController.imagePath2)) as ImageProvider
                : AssetImage("images/logo.png"),
          )),
        ],

        ),

      );
    }
}

//


//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<cameraController>(builder: (logic) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 40,
//             backgroundColor: Colors.grey,
//             backgroundImage:  logic.pickedImageFile != null
//                 ? FileImage(logic.pickedImageFile as File)
//                 : null,
//           ),
//           TextButton.icon(
//             onPressed: logic.pickImage,
//             icon: const Icon(Icons.image),
//             label: const Text('Add Image'),
//           ),
//         ],
//       );
//     });
//   }
// }
