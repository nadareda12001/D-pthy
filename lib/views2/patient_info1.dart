import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller2/home%201%20Controller.dart';
import 'package:flutter_app/controller2/signup_controller.dart';

import 'package:flutter_app/views2/home.dart';
import 'package:flutter_app/views2/profile_patient.dart';
import 'package:get/get.dart';

import '../models2/constants/color.dart';
import '../widgets2/loading.dart';


class Patient_info1 extends StatefulWidget {


  @override
  State<Patient_info1> createState() => _Patient_info1State();
}

class _Patient_info1State extends State<Patient_info1> {


  CollectionReference info2ref = FirebaseFirestore.instance.collection("info3");





  var name, email, gender,age;
  GlobalKey <FormState>_fady = GlobalKey();

  //GlobalKey<FormState> formstate4 = new GlobalKey<FormState>();
  addInfo2(context) async {
    var formdata = _fady.currentState;
    if (formdata!.validate()) {
      showLoading(context);
      formdata.save();


      await info2ref.add({
        "name": name,
        "email": email,
        "gender": gender,
        "age": age,
        "userid": FirebaseAuth.instance.currentUser!.uid
      }).then((value) {
        //Get.offAllNamed("/home");
        Navigator.of(context).pushNamed('/home');
      }).catchError((e) {
        print("$e");
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    //final Home_1_Controller _Home_1_Controller = Get.put(Home_1_Controller());
    return Scaffold(
        backgroundColor: Color.fromRGBO(96, 125, 139, 100),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [

                Center(
                  child:Container(
                    child: Center(child: Text("Patient Info",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadiusDirectional.circular(50.0)),
                  ),
                ),

                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _fady,
                    child: Column(
                      children: <Widget>[
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
                            name = val;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Name',
                            hintStyle: TextStyle( fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),
                          ),
                          style: TextStyle( fontSize: 16,
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
                            email = val;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'email',
                            hintStyle: TextStyle( fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),
                          ),
                          style: TextStyle( fontSize: 16,
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
                            gender = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'gender',
                            hintStyle: TextStyle( fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),
                          ),
                          style: TextStyle( fontSize: 16,
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
                            age = val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Age',
                            hintStyle: TextStyle( fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,),
                          ),
                          style: TextStyle( fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,),

                        ),
                        SizedBox(height: 50),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                              color: Colors.blueGrey,
                              splashColor: Colors.white,
                              height: 50,
                              minWidth: Get.width/3 ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                'Submit',
                                style:  TextStyle( fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,),
                              ),
                              onPressed: () async {
                                {
                                  await addInfo2(context);
                                }
                              }),
                        ),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}