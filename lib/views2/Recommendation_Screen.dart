import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller2/home 1 Controller.dart';
import 'doctor1_screen.dart';
class Recommendation_screen extends StatefulWidget {
  const Recommendation_screen({Key? key}) : super(key: key);

  @override
  _Recommendation_screenState createState() => _Recommendation_screenState();
}

class _Recommendation_screenState extends State<Recommendation_screen> {
  CollectionReference namerf = FirebaseFirestore.instance.collection('doctors');
  getUser(){
    var user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
  //  getFirebaseImageFolder();
    getUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final Home_1_Controller _Home_1_Controller = Get.put(Home_1_Controller());
    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 10),
      appBar: AppBar(backgroundColor: Color.fromRGBO(96, 125, 139, 10),title: Text("Doctors",style: TextStyle(fontSize: 30),),centerTitle: true),
      drawer: drawerscreen(),
      body: FutureBuilder(
          future: namerf
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return
                      ListNotes(
                        notes: snapshot.data!.docs[index],
                        // docid: snapshot.data!.docs[index].id,
                      );
                  },),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
class ListNotes extends StatelessWidget {
  final notes;

  ListNotes({this.notes});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Container(
              height: Get.height / 6,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadiusDirectional.circular(30.0)),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return doctor1(notes: notes);
              }));
                },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: CircleAvatar(
                      backgroundImage: NetworkImage("${notes["image"]}"),
                        radius: 50,
                        backgroundColor: Color.fromRGBO(96, 125, 139, 100),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${notes["name"]}",
                              //   formattedDate,
                              style: TextStyle(
                                  fontSize: 20,
                                  color:Color.fromRGBO(96, 125, 139, 100)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "${notes["street"]}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:Color.fromRGBO(96, 125, 139, 100)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Experience",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(96, 125, 139, 100)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
// List images=[];
// void getFirebaseImageFolder() {
//   final  storageRef =
//   FirebaseStorage.instance.ref().child('image');
//   storageRef.listAll().then((result) {
//     images.add(result);
//   });
// }