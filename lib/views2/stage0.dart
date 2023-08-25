import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/Advices.dart';
import 'package:flutter_app/views2/drawer.dart';
import 'package:flutter_app/views2/home1.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller2/camera_controller.dart';
import 'home.dart';
class stage0 extends StatefulWidget {

  const stage0( {Key? key}) : super(key: key);

  @override
  _stage0State createState() => _stage0State();
}

class _stage0State extends State<stage0> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("photos");

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 10),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 125, 139, 10),
        elevation: 0,
      ),
      drawer: drawerscreen(),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100,right: 100),
              child: Container(

                height: Get.height/9,
                decoration: BoxDecoration(

                  borderRadius: BorderRadiusDirectional.circular(100),color: Colors.black26,),
                child: Center(
                  child: Text("Result",style: TextStyle(
                      color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
                  ),),
                ),),
            ),
            SizedBox(height: Get.height/13,),
            Center(
              child:Container(
                child:    CircleAvatar(
                  radius: Get.width/4,
                  backgroundImage: imagePicked == null
                      ? null
                      : FileImage(
                    imagePicked!,
                  ),
                  //child: Image.network(url),






                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(27),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    height: Get.height/13,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white30,),
                    child: Center(
                      child: Text(" Stage1 ",style: TextStyle(
                          color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    height: Get.height/13,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white30,),
                    child: Center(
                      child: Text(" Stage2 ",style: TextStyle(
                          color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    height: Get.height/13,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white30,),
                    child: Center(
                      child: Text(" Stage3 ",style: TextStyle(
                          color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    height: Get.height/13,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white30,),
                    child: Center(
                      child: Text(" Stage4 ",style: TextStyle(
                          color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                    ),),
                ),
              ],),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child:Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height/6,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusDirectional.circular(30),color: Colors.white,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "hjghgj",style: TextStyle(
                        color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: ()=>Get.to(HomePage1()),
                      child: const Text("Skip",
                        style: TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.underline),
                        textAlign: TextAlign.right,))),
            ),

          ],
        ),
      ),


      )
      ,
    );
  }
}
