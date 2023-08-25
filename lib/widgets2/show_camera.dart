import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../controller2/camera_controller.dart';
import '../controller2/image_picker_controller.dart';
import '../views2/profile_patient.dart';
class Show_D extends StatefulWidget {
  const Show_D({Key? key}) : super(key: key);

  @override
  State<Show_D> createState() => _Show_DState();
}
Future<void> Dialog(context) async {
  Get.defaultDialog(
                  title: 'Choose ',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        onTap: () {
                          takePhoto(ImageSource.camera, context);
                        },
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                      ),
                      InkWell(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.image,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        onTap: () {
                          takePhoto(ImageSource.gallery, context);
                        },
                      ),
                    ],
                  )
                );
}
class _Show_DState extends State<Show_D> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 150),
      body: Column(children: [
        Stack(
          alignment: Alignment.center,
          children: [
            GetBuilder<CameraController>(builder: (CameraController)=>CircleAvatar(
              radius: 70,
              backgroundImage: CameraController.box4.read('set5') == true
                  ? FileImage(File(CameraController.box4.read('image5'))) as ImageProvider
                  : AssetImage("images/logo.png"),
            )),
            Positioned(
              width: 30,
              right: 30,
              bottom: 0,
              child: InkWell(
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.black87,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => bottomSheet(context),
                  );
                },
              ),
            ),
          ],
        ),

    Center(
        child: MaterialButton(
          color: Colors.blueGrey,
            child: Text("Take Photo"),
            onPressed: (){
          Get.defaultDialog(
            title: 'Choose ',
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.camera,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  onTap: () {
                    takePhoto(ImageSource.camera, context);
                  },
                ),
                SizedBox(
                  width: Get.width * 0.4,
                ),
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.image,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  onTap: () {
                    takePhoto(ImageSource.gallery, context);
                  },
                ),
              ],
            )
          );
        }),
      ),
      ],),
    );
  }
}
