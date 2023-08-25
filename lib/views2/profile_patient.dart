import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/drawer.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views2/login.dart';
import 'package:flutter_app/views2/patient_info.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../controller2/image_picker_controller.dart';

class patient_profile extends StatefulWidget {
  @override
  State<patient_profile> createState() => _patient_profileState();
}
class _patient_profileState extends State<patient_profile> {
  CollectionReference notesref =
      FirebaseFirestore.instance.collection("photos");
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.off(LoginView());
            },
            child: Text(
              "Log Out",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 15),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      drawer: drawerscreen(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    painter: StackedWavesPainter(),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GetBuilder<ImagePickerController>(
                                    builder: (imagePickerController) =>
                                        CircleAvatar(
                                          radius: 70,
                                          backgroundImage: imagePickerController
                                                      .box1
                                                      .read('set5') ==
                                                  true
                                              ? FileImage(File(
                                                      imagePickerController
                                                          .box1
                                                          .read('image5')))
                                                  as ImageProvider
                                              : AssetImage(
                                                  "images/person3.jpg",
                                                ),
                                        )),
                                Positioned(
                                  width: 50,
                                  right: 10,
                                  bottom: 0,
                                  child: InkWell(
                                    child: const Icon(
                                      size: 30,
                                      Icons.camera_alt,
                                      color: Colors.black87,
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            bottomSheet(context),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                              future: getEmail(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Center(
                                        // here only return is missing
                                        child: Text(name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)));
                                  }
                                } else if (snapshot.hasError) {
                                  return Text('no data');
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text("Gender : ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                FutureBuilder(
                                  future: getEmail(),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Center(
                                            // here only return is missing
                                            child: Text(gender,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)));
                                      }
                                    } else if (snapshot.hasError) {
                                      return Text('no data');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Age : ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                FutureBuilder(
                                  future: getEmail(),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Center(
                                            // here only return is missing
                                            child: Text(age,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)));
                                      }
                                    } else if (snapshot.hasError) {
                                      return Text('no data');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Diabetic : ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                FutureBuilder(
                                  future: getEmail1(),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Center(
                                            // here only return is missing
                                            child: Text(diabetic,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)));
                                      }
                                    } else if (snapshot.hasError) {
                                      return Text('no data');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Pressure : ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                FutureBuilder(
                                  future: getEmail1(),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Center(
                                            // here only return is missing
                                            child: Text(pressure,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)));
                                      }
                                    } else if (snapshot.hasError) {
                                      return Text('no data');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      Container(
                        child: FutureBuilder(
                          future: notesref.where("userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                  height: Get.height / 2,
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListNotes(
                                          notes: snapshot.data!.docs[index],
                                        );}));}
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          child: Text(
                            "update",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Get.to(Patient_info());
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StackedWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blueGrey;
    paint.style = PaintingStyle.fill;
    final double side = 80;
    final double radius = 80;
    final path = Path()
      ..moveTo(0, size.height / 4 + side)
      ..arcToPoint(Offset(side, size.height / 4),
          radius: Radius.circular(radius))
      ..lineTo(size.width - side, size.height / 4)
      ..arcToPoint(Offset(size.width, size.height / 4 - side),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.save();
    canvas.drawPath(path, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(0, 100);
    canvas.drawPath(path, Paint()..color = Colors.white);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget bottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    height: 100,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select or Capture Photo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Column(
                children: const [
                  Icon(
                    Icons.camera,
                    color: Colors.purple,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ],
              ),
              onTap: () {
                takePhoto(ImageSource.camera, context);
              },
            ),
            SizedBox(
              width: size.width * 0.4,
            ),
            InkWell(
              child: Column(
                children: const [
                  Icon(
                    Icons.image,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
              onTap: () {
                takePhoto(ImageSource.gallery, context);
              },
            ),
          ],
        )
      ],
    ),
  );
}

File? imageFile;
ImagePicker imagePicker = ImagePicker();
final ImagePickerController imagePickerController =
    Get.find<ImagePickerController>();

Future<void> takePhoto(ImageSource source, BuildContext context) async {
  final pickedImage =
      await imagePicker.pickImage(source: source, imageQuality: 100);

  imageFile = File(pickedImage!.path);

  imagePickerController.setImagePath(imageFile!.path);
  Navigator.pop(context);
}

class ListNotes extends StatelessWidget {
  final notes;
  final docid;
  ListNotes({this.notes, this.docid});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: Get.height / 6,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(96, 125, 139, 100),
                    borderRadius: BorderRadiusDirectional.circular(30.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${notes['imageurl']}",
                        ),
                        radius: 50,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${notes['time']}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${notes["eye"]}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${notes["result"]}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                              future: getEmail1(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Center(
                                        // here only return is missing
                                        child: Text(typediabetic,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)));
                                  }
                                } else if (snapshot.hasError) {
                                  return Text('no data');
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

var name;
var age;
var gender;
var diabetic;
var typediabetic;
var pressure;
Future<String> getEmail() async {
  String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
  var a = await FirebaseFirestore.instance
      .collection("info2")
      .where('userid', isEqualTo: _email)
      .get();
  name = a.docs[0]['name'];
  age = a.docs[0]['age'];
  gender = a.docs[0]['gender'];
  return name;
}

Future<String> getEmail1() async {
  String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
  var a = await FirebaseFirestore.instance
      .collection("info")
      .where('userid', isEqualTo: _email)
      .get();
  diabetic = a.docs[0]['DiabeticType'];
  pressure = a.docs[0]['pressure'];
  typediabetic = a.docs[0]['Sugerlevel'];
  return pressure;
}
