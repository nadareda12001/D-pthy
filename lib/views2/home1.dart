
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_app/views2/patient_info.dart';
import 'package:flutter_app/views2/patient_info1.dart';
import 'package:flutter_app/views2/profile_patient.dart';
import 'package:flutter_app/widgets2/loading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';
import '../controller2/radio_controller.dart';
import '../controller2/signup_controller.dart';
import '../models2/constants/color.dart';
import 'doctor_profile.dart';



class HomePage1 extends StatefulWidget {
  HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();



}

class _HomePage1State extends State<HomePage1> {
  String ?p;
  Future<Object> getEmail2() async {
    String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
    var a = await FirebaseFirestore.instance
        .collection("users")
        .where('userid',isEqualTo: _email )
        .get();
    p=a.docs[0]['PatientOrDoctor'];

    return p!;
  }
  @override
  void initState() {
    //  getFirebaseImageFolder();
    getEmail2();
    // TODO: implement initState
    super.initState();
  }

  // if (response != null) {
  // Get.to(HomePage1());
  // await FirebaseFirestore.instance
  //     .collection("users")
  //     .add({"username": myusername, "email": myemail,"PatientOrDector":select});
  CollectionReference info1ref = FirebaseFirestore.instance.collection("info");
  var Sugerlevel, pressure, DiabeticType;
  final ProfilePageController _profilePageController = Get.put(ProfilePageController());
 //GlobalKey<FormState> oneform = new GlobalKey<FormState>();
  //GlobalKey<FormState>keys. formstate1;
  GlobalKey <FormState>_abcKey = GlobalKey();

  addInfo1(context) async {
    var formdata =_abcKey.currentState;
    if (formdata!.validate()) {
      showLoading(context);
      formdata.save();


      await info1ref.add({
        "Sugerlevel": Sugerlevel,
        "pressure": pressure,
        "DiabeticType": DiabeticType,
        "userid": FirebaseAuth.instance.currentUser!.uid
      }).then((value) {

        p=="Patient"?Get.offAll (Patient_info()):Get.offAll(Patient_info1());
      }).catchError((e) {
        print("$e");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final SignUpController _SignUpController = Get.put(SignUpController());
    //final Home_1_Controller _Home_1_Controller = Get.put(Home_1_Controller());
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SafeArea(
            child: Container(
              child: ListView(

                  children: [
                    Image.asset(
                      'images/home 1.png',

                    ),
                     SizedBox(height: 16,),
                    Text(
                      "Hey ",
                      style: TextStyle(color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                    Text("Welcome home ", style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,),),

                    SizedBox(height: 20,),


                    Form(
                        key:_abcKey,
                        child: Column(children: [
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 20) {
                                return "Title can't to be larger than 30 letter";
                              }
                              if (val.length < 2) {
                                return "Title can't to be less than 2 letter";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Sugerlevel = val;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'blood Suger level',
                              hintStyle: TextStyle(fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,),
                            ),
                            style: TextStyle(fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 20) {
                                return "Title can't to be larger than 30 letter";
                              }
                              if (val.length < 2) {
                                return "Title can't to be less than 2 letter";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              pressure = val;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'blood pressure',
                              hintStyle: TextStyle(fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,),
                            ),
                            style: TextStyle(fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),

                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 20) {
                                return "Title can't to be larger than 30 letter";
                              }
                              if (val.length < 2) {
                                return "Title can't to be less than 2 letter";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              DiabeticType = val;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'type of diabetic',
                              hintStyle: TextStyle(fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,),
                            ),
                            style: TextStyle(fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),

                          ),
                          SizedBox(height: 30),


                          Container(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                                color: Colors.blueGrey,
                                splashColor: Colors.white,
                                height: 50,
                                minWidth: Get.width / 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      100),
                                ),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,),
                                ),
                                onPressed: () async {

                                    await addInfo1(context);

                                }),
                          )


                        ])),
                  ]),
            ))
    );
  }

}