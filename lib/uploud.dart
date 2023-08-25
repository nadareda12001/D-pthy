// import 'package:flutter/material.dart';
//
// class ViewNote extends StatefulWidget {
//   final users;
//   ViewNote({Key? key, this.users}) : super(key: key);
//
//   @override
//   _ViewNoteState createState() => _ViewNoteState();
// }
//
// class _ViewNoteState extends State<ViewNote> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Notes'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//
//             Container(
//                 margin: EdgeInsets.symmetric(vertical: 15),
//                 child: Text(
//                   "${widget.users()['users']}",
//                   style: Theme.of(context).textTheme.headline5,
//                 )),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class ViewNote extends StatefulWidget {
//   ViewNote({Key? key}) : super(key: key);
//
//   @override
//   _ViewNoteState createState() => _ViewNoteState();
// }
//
// class _ViewNoteState extends State<ViewNote> {
//   CollectionReference notesref = FirebaseFirestore.instance.collection("users");
//
//   getUser() {
//     var user = FirebaseAuth.instance.currentUser;
//     print(user!.email);
//   }
//
//
//
















//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HomePage'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.exit_to_app),
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.of(context).pushReplacementNamed("login");
//               })
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Theme.of(context).primaryColor,
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.of(context).pushNamed("addnotes");
//           }),
//       body: Container(
//         child: FutureBuilder(
//             future: notesref
//                 .where("userid",
//                 isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//                 .get(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, i) {
//                       return Dismissible(
//                           onDismissed: (diretion) async {
//                             await notesref
//                                 .doc(snapshot.data!.docs[i].id)
//                                 .delete();
//                             await FirebaseStorage.instance
//                                 .refFromURL(snapshot.data!.docs[i]['imageurl'])
//                                 .delete()
//                                 .then((value) {
//                               print("=================================");
//                               print("Delete");
//                             });
//                           },
//                           key: UniqueKey(),
//                           child: ListNotes(
//                             notes: snapshot.data!.docs[i],
//                             docid: snapshot.data!.docs[i].id,
//                           ));
//                     });
//               }
//               return Center(child: CircularProgressIndicator());
//             }),
//       ),
//     );
//   }
// }
//
// class ListNotes extends StatelessWidget {
//   final notes;
//   final docid;
//   ListNotes({this.notes, this.docid});
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//         //   return// ViewNote(notes: notes);
//         // }));
//       },
//       child: Card(
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Image.network(
//                 "${notes['imageurl']}",
//                 fit: BoxFit.fill,
//                 height: 80,
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: ListTile(
//                 title: Text("${notes['title']}"),
//                 subtitle: Text(
//                   "${notes['note']}",
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 trailing: IconButton(
//                   onPressed: () {
//                     // Navigator.of(context)
//                     //     .push(MaterialPageRoute(builder: (context) {
//                     //  // return EditNotes(docid: docid, list: notes);
//                     // }));
//                   },
//                   icon: Icon(Icons.edit),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
//
//
// enum BG {
//   month,
//   year,
// }
//
// class UploadImage extends StatefulWidget {
// //  final String packageTitle;
// //  final BG packageType;
// //
// ////  final int packageTitleNum;
// //  final Function() function;
//   static var load = false;
//
//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }
//
// class _UploadImageState extends State<UploadImage> {
//   late Image img;
//
// ////    required this.packageTitle,
// ////    required this.packageType,
// ////    required this.function,
// //  }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar:
//       // DefaultAppBar(
//       //   LFunction: () {
//       //     Navigator.pop(context);
//       //   },
//       //   LeadingIcon: Icons.arrow_back,
//       //   text: 'Smart Retina',
//       //   // AFunction: () {
//       //   //   Scaffold.of(context).openEndDrawer();
//       //   // },
//       // ),
//       // AppBar(
//       //   primary: true,
//       //   centerTitle: true,
//       //   title: const Text("Pro Membership"),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8.0),
//         child: InkWell(
//           onTap: () {},
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 400.0,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 5.0, horizontal: 25.0),
//                   child: Center(
//                     // ignore: dead_code
//                     child: UploadImage.load
//                         ? img
//                         : const Text(
//                       'Retina Image',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.black45,
//                   borderRadius: BorderRadius.circular(20.0),
// //            boxShadow: const [
// //              BoxShadow(
// //                color: Colors.white,
// //                blurRadius: 2.0,
// //                offset: Offset(4.0, 4.0),
// //              )
// //            ],
//                 ),
//               ),
// //              Positioned(
// //                bottom: 0.5,
// //                left: 0.5,
// //                right: 0.5,
// //                child: Container(
// //                  height: 160.0,
// ////                width: MediaQuery.of(context).size.width * .9,
// //                  decoration: BoxDecoration(
// //                    color: Colors.white.withOpacity(0.99),
// //                    borderRadius: BorderRadius.circular(20.0),
// //                  ),
// //                  child: Column(
// //                    children: const [
// //                      Padding(
// //                        padding: EdgeInsets.all(15.0),
// //                        child: Center(
// //                          child: Text(
// //                            'Retina Image',
// //                            style: TextStyle(
// //                              fontSize: 30,
// //                              color: Colors.deepPurple,
// //                              fontWeight: FontWeight.w900,
// //                            ),
// //                          ),
// //                        ),
// //                      ),
// ////                      Center(
// ////                        child: Container(
// ////                          color: packageType == BG.month
// ////                              ? Colors.green.shade200
// ////                              : Colors.red.shade100,
// ////                          child: Padding(
// ////                            padding: const EdgeInsets.all(8.0),
// ////                            child: Text(
// ////                              packageType == BG.month
// ////                                  ? 'Most Popular'
// ////                                  : '+20 photos free',
// ////                              style: const TextStyle(
// ////                                fontSize: 16,
// //////                            backgroundColor: Colors.greenAccent,
// ////                                color: Colors.deepPurple,
// ////                                fontWeight: FontWeight.w900,
// ////                              ),
// ////                            ),
// ////                          ),
// ////                        ),
// ////                      ),
// ////                      Padding(
// ////                        padding: const EdgeInsets.all(8.0),
// ////                        child: Column(
// ////                          children: [
// ////
// ////                            const Text(
// ////                              'The package alows you to',
// ////                              maxLines: 2,
// ////                              style: TextStyle(
// ////                                fontSize: 16,
// //////                            backgroundColor: Colors.greenAccent,
// ////                                color: Colors.deepPurple,
// ////                                fontWeight: FontWeight.w900,
// ////                              ),
// ////                            ),
// ////                            Text(
// ////                              packageType == BG.month
// ////                                  ? 'detect up to 10 photo'
// ////                                  : 'detect up to 100 photo',
// ////                              maxLines: 2,
// ////                              style: const TextStyle(
// ////                                fontSize: 16,
// //////                            backgroundColor: Colors.greenAccent,
// ////                                color: Colors.deepPurple,
// ////                                fontWeight: FontWeight.w900,
// ////                              ),
// ////                            ),
// ////                          ],
// ////                        ),
// ////                      ),
// //                    ],
// //                  ),
// //                ),
// //              ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 25.0,
//                 ),
//                 child:TextButton(
//                   onPressed: uploadImage,
//                   child: const Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Text('upload',
//                         style: TextStyle(
//                           backgroundColor:Colors.deepPurpleAccent ,
//                           fontSize: 18,
//                           color: Colors.white,
//                         )),
//                   ),
//                   //color: Colors.deepPurpleAccent,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> uploadImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       File file = File(result.files.single.path.toString());
//       Image.asset('');
//       setState(() {
//         img = Image.file(file);
//         UploadImage.load = true;
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
// }
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/views2/home.dart';
// import 'package:flutter_app/views2/sign%20up.dart';
// import 'package:get/get.dart';
//
//
// import '../controller2/login_controller.dart';
//
//
// class LoginView extends StatelessWidget {
//   final LoginController _loginController = Get.put(LoginController());
//   //final LoginController controller = Get.find<LoginController>();
//   final _formKey2 = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//
//         body:ListView(
//           children: [
//             Stack(
//               children: <Widget>[
//                 Container(
//
//                   height: MediaQuery.of(context).size.height * 0.25,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [Colors.blueGrey,Color.fromRGBO(96, 125, 139, 100),],begin: Alignment.topCenter,end: Alignment.bottomCenter),
//                     //color: Color.fromRGBO(96, 125, 139, 80),
//
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(100),
//                       bottomRight: Radius.circular(100),
//                     ),
//                   ),
//                 ),
//                 Container(alignment: Alignment.topRight,
//                     child: TextButton(onPressed: (){Get.to(SignUpView(),);},
//                         child: Text("Sign up",
//                           style: TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.underline),
//                           textAlign: TextAlign.right,))),
//                 Center(
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 65),
//                       Center(
//                         child: Text(
//                           'Sign in',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 32,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 1.2),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 40.0,bottom: 40),
//                         child: Hero(
//                           tag: 'logoAnimation',
//                           child: Image.asset(
//                             'images/logo.png',
//                             height: 150,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.all(35),
//               child: Form(
//                 key: _formKey2,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       controller: _loginController.emailTextController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.email_outlined),
//                         fillColor: Colors.grey[200],
//                         filled: true,
//                         hintText: 'Email',
//                         hintStyle: TextStyle( fontSize: 16,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                       ),
//                       style: TextStyle( fontSize: 16,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.normal,),
//                       validator: (value) =>
//                       value!.trim().isEmpty ? 'Email required' : null,
//                     ),
//                     SizedBox(height: 16),
//
//                     Obx(() => TextFormField(
//
//                       controller: _loginController.passwordTextController,
//                       obscureText: _loginController.hidePassword.value,
//                       decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                           icon: _loginController.hidePassword.value ? Icon(Icons.visibility_off)
//                               : Icon(Icons.visibility),
//                           onPressed: () {
//                             _loginController.hidePassword.value = !_loginController.hidePassword.value;
//                           },
//                         ),
//                         prefixIcon: Icon(Icons.vpn_key),
//                         fillColor: Colors.grey[200],
//                         filled: true,
//                         hintText: 'Password',
//                         hintStyle: TextStyle( fontSize: 16,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) =>
//                       value!.trim().isEmpty ? 'Password required' : null,
//                       style: TextStyle( fontSize: 16,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.normal,),
//                     ),
//                     ),SizedBox(height: 16),
//                     Container(alignment: Alignment.bottomRight,
//                         child: TextButton(onPressed: (){},
//                             child: const Text("forget password",
//                               style: TextStyle(fontSize: 15,color: Colors.red,decoration: TextDecoration.underline),
//                               textAlign: TextAlign.right,))),
//                     SizedBox(height: 30),
//                     MaterialButton(
//                         color: Colors.blueGrey,
//                         splashColor: Colors.white,
//                         height: 60,
//                         minWidth: Get.width ,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Text(
//                           'Sign in',
//                           style:  TextStyle( fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.normal,),
//                         ),
//                         onPressed: () {
//                           if (_formKey2.currentState!.validate()) {
//                             // _loginController.apiLogin();
//                             Get.to(HomePage());
//                           }
//                         })
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )
//
//     );
//   }
// }
//
// /*
//
// showLoading(context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Please Wait"),
//           content: Container(
//               height: 50,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               )),
//         );
//       });
// }
//

// import 'dart:math';
//
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_app/widgets2/loading.dart';
// import 'package:path/path.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class HomePage1 extends StatefulWidget {
//   HomePage1({Key? key}) : super(key: key);
//
//   @override
//   _HomePage1State createState() => _HomePage1State();
// }
//
// class _HomePage1State extends State<HomePage1> {
//   CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
//
//   Reference ?ref;
//
//   File ?file;
//
//   var title, note, imageurl;
//
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//
//   addNotes(context) async {
//     if (file == null)
//       return AwesomeDialog(
//           context: context,
//           title: "هام",
//           body: Text("please choose Image"),
//           dialogType: DialogType.ERROR)
//         ..show();
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       showLoading(context);
//       formdata.save();
//       await ref!.putFile(file!);
//       imageurl = await ref!.getDownloadURL();
//       await notesref.add({
//         "title": title,
//         "note": note,
//         "imageurl": imageurl,
//         "userid": FirebaseAuth.instance.currentUser!.uid
//       }).then((value) {
//         Navigator.of(context).pushNamed("patient_info");
//       }).catchError((e) {
//         print("$e");
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Note'),
//       ),
//       body: Container(
//           child: Column(
//             children: [
//               Form(
//                   key: formstate,
//                   child: Column(children: [
//                     TextFormField(
//                       validator: (val) {
//                         if (val!.length > 30) {
//                           return "Title can't to be larger than 30 letter";
//                         }
//                         if (val.length < 2) {
//                           return "Title can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       onSaved: (val) {
//                         title = val;
//                       },
//                       maxLength: 30,
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: "Title Note",
//                           prefixIcon: Icon(Icons.note)),
//                     ),
//                     TextFormField(
//                       validator: (val) {
//                         if (val!.length > 255) {
//                           return "Notes can't to be larger than 255 letter";
//                         }
//                         if (val.length < 10) {
//                           return "Notes can't to be less than 10 letter";
//                         }
//                         return null;
//                       },
//                       onSaved: (val) {
//                         note = val;
//                       },
//                       minLines: 1,
//                       maxLines: 3,
//                       maxLength: 200,
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: "Note",
//                           prefixIcon: Icon(Icons.note)),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         showBottomSheet(context);
//                       },
//
//                       child: Text("Add Image For Note"),
//                     ),
//                    TextButton(
//                       onPressed: () async {
//                         await addNotes(context);
//                       },
//
//                       child: Text(
//                         "Add Note",
//                         style: Theme.of(context).textTheme.headline6,
//                       ),
//                     )
//                   ]))
//             ],
//           )),
//     );
//   }
//
//   showBottomSheet(context) {
//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             padding: EdgeInsets.all(20),
//             height: 180,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Please Choose Image",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     var picked = await ImagePicker()
//                         .getImage(source: ImageSource.gallery);
//                     if (picked != null) {
//                       file = File(picked.path);
//                       var rand = Random().nextInt(100000);
//                       var imagename = "$rand" + basename(picked.path);
//                       ref = FirebaseStorage.instance
//                           .ref("images")
//                           .child("$imagename");
//
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.photo_outlined,
//                             size: 30,
//                           ),
//                           SizedBox(width: 20),
//                           Text(
//                             "From Gallery",
//                             style: TextStyle(fontSize: 20),
//                           )
//                         ],
//                       )),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     var picked = await ImagePicker()
//                         .getImage(source: ImageSource.camera);
//                     if (picked != null) {
//                       file = File(picked.path);
//                       var rand = Random().nextInt(100000);
//                       var imagename = "$rand" + basename(picked.path);
//                       ref = FirebaseStorage.instance
//                           .ref("images")
//                           .child("$imagename");
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.camera,
//                             size: 30,
//                           ),
//                           SizedBox(width: 20),
//                           Text(
//                             "From Camera",
//                             style: TextStyle(fontSize: 20),
//                           )
//                         ],
//                       )),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
