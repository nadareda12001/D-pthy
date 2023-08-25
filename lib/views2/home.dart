import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/vaildation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../controller2/camera_controller.dart';
import '../controller2/home_controller.dart';
var result;
var responseJson;
var name1;
TextEditingController name2 = TextEditingController();
String? eye;
GlobalKey<FormState> uniqustate1 = new GlobalKey<FormState>();
Reference? ref;
DateTime now = DateTime.now();
var formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
CollectionReference notesref = FirebaseFirestore.instance.collection("photos");
File? file;

image() async {
  await ref?.putFile(file!);
  String? imageurl = await ref?.getDownloadURL();
  await notesref.add({
    "result": result,
    "eye": eye,
    "name1": name1,
    "time": formattedDate,
    "imageurl": imageurl,
    "userid": FirebaseAuth.instance.currentUser!.uid
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String? p;
  Future<Object> getEmail2() async {
    String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
    var a = await FirebaseFirestore.instance
        .collection("users")
        .where('userid', isEqualTo: _email)
        .get();
    p = a.docs[0]['PatientOrDoctor'];
    return p!;
  }
  @override
  void initState() {
    //  getFirebaseImageFolder();
    getEmail2();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    final Home_Controller controller = Get.put(Home_Controller());
    Get.lazyPut(() => Home_Controller());
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: "/patient",
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35),
              label: '',
            ),
            BottomNavigationBarItem(
                label: '',
                backgroundColor: Colors.blueGrey,
                icon: InkWell(
                  radius: 30,
                  child: Center(
                      child: Icon(
                    Icons.camera_alt,
                    size: 50,
                  )),
                  onTap: () {
                    p == "Patient" ? direction_eye(context) : name(context);
                  },
                )),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded, size: 35),
              label: '',
            ),
          ],
          unselectedItemColor: Colors.blueGrey,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.blueGrey,
          onTap: controller.changePage,
        ),
      ),
    );
  }

  File? imageFile1;
  ImagePicker imagePicker1 = ImagePicker();
  final CameraController cameraController = Get.find<CameraController>();
  Future<void> takePhoto1(ImageSource source1, BuildContext context) async {
    final pickedImage1 =
        await imagePicker1.pickImage(source: source1, imageQuality: 100);
    imageFile1 = File(pickedImage1!.path);
    cameraController.setImagePath1(imageFile1!.path);
    Navigator.pop(context);
    //Get.to(vaildation());
  }

  name(context) {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'type name of patient ',
        titleStyle: TextStyle(color: Colors.blueGrey),
        content: Column(children: [
          TextField(
            controller: name2,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: InputDecoration(
                //  labelText: 'Category Name',
                hintMaxLines: 1,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey, width: 4.0))),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              //alignment: Alignment.bottomRight,
              child: MaterialButton(
                  color: Colors.blueGrey,
                  splashColor: Colors.white,
                  height: 50,
                  minWidth: Get.width / 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'ok',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      name1 = name2.text;
                    });
                    Navigator.of(context).pop();
                    direction_eye(context);
                  }),
            ),
          )
        ]));
  }

  direction_eye(context) {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'Select your eye',
        titleStyle: TextStyle(color: Colors.blueGrey),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      "Left",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  eye = "Left";
                });
                Navigator.of(context).pop();
                camera(context);
              },
            ),
            SizedBox(
              width: Get.width * 0.2,
            ),
            InkWell(
              child: Column(
                children: const [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    "Right",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  eye = "Right";
                });
                Navigator.of(context).pop();
                camera(context);
              },
            ),
          ],
        ));
  }
}

File? imagePicked;
camera(context) {
  Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Select or Capture Photo ',
      titleStyle: TextStyle(color: Colors.blueGrey),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
            ),
            onTap: () async {
              var picked =
                  await ImagePicker().getImage(source: ImageSource.camera);
              if (picked != null) {
                file = File(picked.path);
                imagePicked = file;
                var rand = Random().nextInt(100000);
                var imagename = "$rand" + basename(picked.path);
                ref =
                    FirebaseStorage.instance.ref("images").child("$imagename");
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return vaildation();
                }));
              }
            },
          ),
          SizedBox(
            width: Get.width * 0.2,
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
            onTap: () async {
              var picked =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              if (picked != null) {
                file = File(picked.path);
                imagePicked = file;
                var rand = Random().nextInt(100000);
                var imagename = "$rand" + basename(picked.path);
                ref = FirebaseStorage.instance.ref("images").child("$imagename");
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return vaildation();
                }));
              }
            },
          ),
        ],
      ));
}
