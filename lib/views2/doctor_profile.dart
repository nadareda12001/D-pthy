import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter_app/views2/home1.dart';
import 'package:flutter_app/views2/patient_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller2/image_picker_controller.dart';
import 'drawer.dart';
import 'login.dart';

class doctor_profile extends StatefulWidget {
  @override
  State<doctor_profile> createState() => _doctor_profileState();
}

class _doctor_profileState extends State<doctor_profile> {
  CollectionReference nameref = FirebaseFirestore.instance.collection('info3');
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }
  var name;
  var email;
  Future<String> getEmail() async {
    String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
    var a = await FirebaseFirestore.instance
        .collection("users")
        .where('userid', isEqualTo: _email)
        .get();
    name = a.docs[0]['username'];
    email = a.docs[0]['email'];
    return name;
  }

  // var name1;
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
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
      drawer: drawerscreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GetBuilder<ImagePickerController>(
                          builder: (imagePickerController) => CircleAvatar(
                                radius: 70,
                                backgroundImage: imagePickerController.box1
                                            .read('set5') ==
                                        true
                                    ? FileImage(File(imagePickerController.box1
                                        .read('image5'))) as ImageProvider
                                    : AssetImage(
                                        "images/person2.jpg",
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
                              builder: (context) => bottomSheet(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
                                      color: Colors.white, fontSize: 25)));
                        }
                      } else if (snapshot.hasError) {
                        return Text('no data');
                      }
                      return CircularProgressIndicator();
                    },
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
                              child: Text(email,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)));
                        }
                      } else if (snapshot.hasError) {
                        return Text('no data');
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("All Patients",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(
                    width: Get.width / 2.1,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed("testscreen");
                    },
                    icon: Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: FutureBuilder(
                  future: nameref
                      .where("userid",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: double.infinity,
                        height: 250,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return ListNotes(
                              notes: snapshot.data!.docs[index],
                              // docid: snapshot.data!.docs[index].id,
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Get.off(HomePage1());
                    },
                    child: const Text(
                      "Add another patient",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.right,
                    ))),
          ],
        ),
      ),
    ));
  }
}

class ListNotes extends StatelessWidget {
  final notes;
  ListNotes({this.notes});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
            // overflow: Overflow.visible,
            alignment: AlignmentDirectional.topCenter,
            // fit: StackFit.loose,
            children: <Widget>[
              Container(
                height: 250,
                width: Get.width / 1.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Positioned(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                            backgroundColor: Colors.blueGrey,
                            radius: 50)),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${notes["name"]}",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return patient_Screen(notes: notes);
                          }));
                        },
                        child: Container(
                            width: Get.width / 1.8,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(96, 125, 139, 100),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "View Profile ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                //style: ElevatedButton.styleFrom(
                                //   backgroundColor: Colors.purple,)
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ))
            ]));
  }
}
