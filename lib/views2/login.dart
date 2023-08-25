import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/sign%20up.dart';
import 'package:flutter_app/widgets2/loading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controller2/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = Get.put(LoginController());
  var mypassword, myemail;
  GlobalKey<FormState> formstate1 = new GlobalKey<FormState>();
  signIn() async {
    var formdata =formstate1.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email"))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user"))
            ..show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blueGrey,Color.fromRGBO(96, 125, 139, 100),],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              Container(alignment: Alignment.topRight,
                  child: TextButton(onPressed: (){Get.to(SignUp(),);},
                      child: Text("Sign up",
                        style: TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.underline),
                        textAlign: TextAlign.right,))),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 65),
                    Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0,bottom: 40),
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
                key: formstate1,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (val!.length > 30) {
                          return "Email can't to be larger than 30 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Email',
                        hintStyle: const TextStyle( fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                      style:const TextStyle( fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,),
                    ),
                    SizedBox(height: 20),
                    Obx(() => TextFormField(
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
                      obscureText: _loginController.hidePassword.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _loginController.hidePassword.value ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            _loginController.hidePassword.value = !_loginController.hidePassword.value;
                          },
                        ),
                        prefixIcon: Icon(Icons.vpn_key),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle( fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,),
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

                      style: TextStyle( fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,),
                    ),),
                    Container(alignment: Alignment.bottomRight,
                        child: TextButton(onPressed: (){},
                            child: const Text("forget password",
                              style: TextStyle(fontSize: 15,color: Colors.red,decoration: TextDecoration.underline),
                              textAlign: TextAlign.right,))),
                    SizedBox(height: 30),
                    MaterialButton(
                        color: Colors.blueGrey,
                        splashColor: Colors.white,
                        height: 60,
                        minWidth: Get.width ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'Sign in',
                          style:  TextStyle( fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,),
                        ),
                        onPressed: () async {
                          var user = await signIn();
                          if (user != null) {
                            Get.toNamed("/home");
                          }
                        })
                  ],
                )),
          )
        ],
      ),
    );
  }
}