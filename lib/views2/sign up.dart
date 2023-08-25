import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller2/radio_controller.dart';
import 'package:flutter_app/views2/home1.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller2/signup_controller.dart';
import '../widgets2/loading.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void onClickRadioButton(value) {
    print(value);
    _profilePageController.select = value;
  }

  var val;
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate0 = new GlobalKey<FormState>();
  signUp() async {
    var formdata = formstate0.currentState;
    if (formdata!.validate() && _profilePageController.select != null) {
      formdata.save();
      try {
        showLoading(context);
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Password is to weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("The account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }
  final SignUpController _SignUpController = Get.put(SignUpController());
  final ProfilePageController _profilePageController =
      Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(96, 125, 139, 80),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 65),
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                      child: Hero(
                        tag: 'logoAnimation',
                        child: Image.asset(
                          'images/logo.png',
                          height: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formstate0,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myusername = val;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "username can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "username can't to be less than 2 letter";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity_sharp),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => TextFormField(
                        onSaved: (val) {
                          mypassword = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "Password can't to be larger than 100 letter";
                          }
                          if (val.length < 4) {
                            return "Password can't to be less than 4 letter";
                          }
                          return null;
                        },
                        obscureText: _SignUpController.hidePassword1.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: IconButton(
                            icon: _SignUpController.hidePassword1.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              _SignUpController.hidePassword1.value =
                                  !_SignUpController.hidePassword1.value;
                            },
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: ' Password',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
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
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.blueGrey,
                                value: _profilePageController.gender[0],
                                groupValue: _profilePageController.select,
                                onChanged: (value) => setState(() {
                                      onClickRadioButton(value);
                                    })),
                            Text("Doctor",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                        ),
                        SizedBox(
                          width: Get.width / 2.5,
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.blueGrey,
                                value: _profilePageController.gender[1],
                                groupValue: _profilePageController.select,
                                onChanged: (value) => setState(() {
                                      onClickRadioButton(value);
                                    })),
                            Text("Patient",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                        color: Colors.blueGrey,
                        splashColor: Colors.white,
                        height: 50,
                        minWidth: Get.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () async {
                          if (_profilePageController.select == null) {
                            showLoading(context);
                            Navigator.of(context).pop();
                            AwesomeDialog(
                                context: context,
                                title: "Error",
                                body: Text("please choose Dector Or Patient"))
                              ..show();
                          }
                          UserCredential response = await signUp();
                          print("===================");

                          if (response != null) {
                            Get.to(HomePage1());

                            await FirebaseFirestore.instance
                                .collection("users")
                                .add({
                              "username": myusername,
                              "email": myemail,
                              "PatientOrDoctor": _profilePageController.select,
                              "userid": FirebaseAuth.instance.currentUser!.uid
                            });
                          } else {
                            print("Sign Up Faild");
                          }
                          print("===================");
                        })
                  ],
                ),
              ))
        ]));
  }
}
