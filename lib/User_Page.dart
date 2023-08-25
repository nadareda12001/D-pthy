import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class UserPage extends StatefulWidget {
//   const UserPage({Key? key}) : super(key: key);
//
//   @override
//   _UserPageState createState() => _UserPageState();
// }
//
// class _UserPageState extends State<UserPage> {
//   final controllerName=TextEditingController();
//   final controllerAge=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//   // return  Scaffold(
//       //     backgroundColor: Colors.white,
//       //     body:
//       //     SafeArea(
//       //         child: ListView(
//       //             children: [
//       //               Stack(
//       //                   children: <Widget>[
//       //                     Image.asset(
//       //                       'images/home 1.png',
//       //
//       //                     ),
//       //                     // Container(
//       //                     //     alignment: Alignment.topRight,
//       //                     //     child: TextButton(child: Text("update",
//       //                     //       style: TextStyle(color: Colors.blueGrey,
//       //                     //           fontSize: 20,
//       //                     //           fontWeight: FontWeight.bold),),
//       //                     //       onPressed: () {},))
//       //
//       //                   ]),
//       //
//       //               Padding(
//       //                 padding: const EdgeInsets.only(left: 10),
//       //                 child: Column(
//       //                   mainAxisAlignment: MainAxisAlignment.start,
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     Text(
//       //                       "Hey ${_SignUpController.NameTextController!.text} ",
//       //                       style: TextStyle(color: Colors.blueGrey,
//       //                           fontSize: 20,
//       //                           fontWeight: FontWeight.bold),),
//       //                     Text("Welcome home ", style: TextStyle(
//       //                       color: Colors.blueGrey,
//       //                       fontSize: 25,
//       //                       fontWeight: FontWeight.bold,),),
//       //                   ],
//       //                 ),
//       //               ),
//       //
//       //               SizedBox(height: 20,),
//       //
//       //
//       //               Container(
//       //                   child: Column(
//       //                     children: [
//       //                       Form(
//       //                           key:Keys. formstate2,
//       //                           child: Column(children: [
//       //                             TextFormField(
//       //                               validator: (val) {
//       //                                 if (val!.length > 20) {
//       //                                   return "Title can't to be larger than 30 letter";
//       //                                 }
//       //                                 if (val.length < 2) {
//       //                                   return "Title can't to be less than 2 letter";
//       //                                 }
//       //                                 return null;
//       //                               },
//       //                               onSaved: (val) {
//       //                                 Sugerlevel = val;
//       //                               },
//       //                               keyboardType: TextInputType.text,
//       //                               decoration: InputDecoration(
//       //                                 fillColor: Colors.grey[200],
//       //                                 filled: true,
//       //                                 hintText: 'blood Suger level',
//       //                                 hintStyle: TextStyle(fontSize: 16,
//       //                                   color: Colors.grey,
//       //                                   fontWeight: FontWeight.normal,),
//       //                               ),
//       //                               style: TextStyle(fontSize: 16,
//       //                                 color: Colors.grey,
//       //                                 fontWeight: FontWeight.normal,),
//       //                             ),
//       //                             SizedBox(height: 20),
//       //                             TextFormField(
//       //                               validator: (val) {
//       //                                 if (val!.length > 20) {
//       //                                   return "Title can't to be larger than 30 letter";
//       //                                 }
//       //                                 if (val.length < 2) {
//       //                                   return "Title can't to be less than 2 letter";
//       //                                 }
//       //                                 return null;
//       //                               },
//       //                               onSaved: (val) {
//       //                                 pressure = val;
//       //                               },
//       //                               keyboardType: TextInputType.text,
//       //                               decoration: InputDecoration(
//       //                                 fillColor: Colors.grey[200],
//       //                                 filled: true,
//       //                                 hintText: 'blood pressure',
//       //                                 hintStyle: TextStyle(fontSize: 16,
//       //                                   color: Colors.grey,
//       //                                   fontWeight: FontWeight.normal,),
//       //                               ),
//       //                               style: TextStyle(fontSize: 16,
//       //                                 color: Colors.grey,
//       //                                 fontWeight: FontWeight.normal,),
//       //
//       //                             ),
//       //                             SizedBox(height: 20),
//       //                             TextFormField(
//       //                               validator: (val) {
//       //                                 if (val!.length > 20) {
//       //                                   return "Title can't to be larger than 30 letter";
//       //                                 }
//       //                                 if (val.length < 2) {
//       //                                   return "Title can't to be less than 2 letter";
//       //                                 }
//       //                                 return null;
//       //                               },
//       //                               onSaved: (val) {
//       //                                 DiabeticType = val;
//       //                               },
//       //                               keyboardType: TextInputType.text,
//       //                               decoration: InputDecoration(
//       //
//       //                                 fillColor: Colors.grey[200],
//       //                                 filled: true,
//       //                                 hintText: 'type of diabetic',
//       //                                 hintStyle: TextStyle(fontSize: 16,
//       //                                   color: Colors.grey,
//       //                                   fontWeight: FontWeight.normal,),
//       //                               ),
//       //                               style: TextStyle(fontSize: 16,
//       //                                 color: Colors.grey,
//       //                                 fontWeight: FontWeight.normal,),
//       //
//       //                             ),
//       //                             SizedBox(height: 30),
//       //
//       //
//       //                             Container(
//       //                               alignment: Alignment.bottomRight,
//       //                               child: MaterialButton(
//       //                                   color: Colors.blueGrey,
//       //                                   splashColor: Colors.white,
//       //                                   height: 50,
//       //                                   minWidth: Get.width / 3,
//       //                                   shape: RoundedRectangleBorder(
//       //                                     borderRadius: BorderRadius.circular(
//       //                                         100),
//       //                                   ),
//       //                                   child: Text(
//       //                                     'Submit',
//       //                                     style: TextStyle(fontSize: 20,
//       //                                       color: Colors.white,
//       //                                       fontWeight: FontWeight.bold,),
//       //                                   ),
//       //                                   onPressed: () async {
//       //
//       //                                       await addInfo1(context);
//       //
//       //                                   }),
//       //                             )
//       //
//       //
//       //                           ]))
//       //                     ],
//       //                   )),
//       //             ]))
//       // );
//     return Scaffold(
//       appBar: AppBar(title: Text("ADD user"),),
//       body: ListView(padding: EdgeInsets.all(16),
//       children: [
//         TextField(
//           controller:controllerName ,
//           decoration: decoraion("name"),),
//         SizedBox(height: 24,),
//         TextField(
//
//           controller: controllerAge,
//           decoration: decoraion("age"),),
//         const SizedBox(height: 32,),
//         TextButton(onPressed: (){
//           final users1= User(
//            name:controllerName.text,
//            age:int.parse((controllerAge.text)),
//           );
//           createUser(users1);
//           Get.toNamed("testscreen");
//           }, child: Text("create"))
//       ],
//       ),
//     );
//
//   }
//
//   InputDecoration? decoraion(String Label) {
//
//     InputDecoration(
//       labelText: Label,
//       border: OutlineInputBorder(),
//     );
//
//   }
//   Future createUser(User users1)async {
//     final docUser=FirebaseFirestore.instance.collection("users1").doc();
//      users1.id=docUser.id;
//     final json=users1.toJson();
//     // final user=User(id:docUser.id,name: name, age: 21);
//     // final json=user.toJson();
//     await docUser.set(json);
//   }
// }
// class User{
//   String id;
//   final String name;
//   final int age;
//   User({
//     this.id="",
//     required this.name,
//     required this.age,
//
//   });
//   Map<String,dynamic>toJson()=>{
//     "id":id,
//     "name":name,
//     "age":age,
//   };
// }
