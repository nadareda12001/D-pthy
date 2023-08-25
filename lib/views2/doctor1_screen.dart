import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import"dart:io";
import '../controller2/Rating_controller.dart';

import 'Rating_doctor.dart';

class doctor1 extends StatefulWidget {
  final notes;

  doctor1({Key? key, this.notes}) : super(key: key);
  @override
  _doctor1State createState() => _doctor1State();

}

class _doctor1State extends State<doctor1> {

 // List ListOfFeedback=["Noooooooooooooooooooooooooooooooo","Noooooooooooooooooooooooooooooooo","Noooooooooooooooooooooooooooooooo"];
  final controller = Get.put(RatingController());
  CollectionReference notesref = FirebaseFirestore.instance.collection("feedback");
  // String ?feedback;
  // List feedback1=[];
  // Future<String> getEmail1() async {
  //   //String? _email = await FirebaseAuth.instance.currentUser?.uid.toString();
  //   var a = await FirebaseFirestore.instance
  //       .collection("feedback")
  //       .where('name',isEqualTo:  widget.notes["name"])
  //       .get().then((value) => {
  //         feedback1.add(value)
  //   });
  //   return feedback!;
  //
  //
  // }
  @override

  Widget build(BuildContext context) {
    String?name1="${widget.notes["name"]}";
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.blueGrey,size: 30)),
      body : ListView(
        children: [
          Stack(
            children: [
              Container(color: Colors.white,height: Get.height/3.8,width: Get.width,),

              // Padding(
              //   padding: const EdgeInsets.only(top: 70),

              //   child: Center(child:Text("Dr. Nada Reda ",style:
              //   TextStyle(fontSize: 25,color: Colors.blueGrey,fontWeight: FontWeight.bold),)),
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:130),
                 child: ClipRRect(

                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),

                      child:Image.network("${widget.notes['image']}",width: 200,height: 200,),
                  // child: Container(
                  //
                  //   child: Image.network("${widget.notes['image']}",fit: BoxFit.cover,),
                  //   height: 200,
                  //   width: 200,
                  //   decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadiusDirectional.circular(30.0)),
                  // ),
                ),
              ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Stack(
            children: [
              Center(
                child: Container(
                  child: Center(child:_buildBody() ,),
                  height: Get.height/24,
                  width: Get.width/2.3,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(30.0)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Center(child:Text("${widget.notes['name']}",style:
          TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
          // SizedBox(height: 20,),
          // Stack(
          //   children: [
          //     Center(
          //       child: Container(
          //         child: Center(child:_buildBody() ,),
          //         height: Get.height/24,
          //         width: Get.width/2.3,
          //         decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadiusDirectional.circular(30.0)),
          //       ),
          //     ),
          //   ],
          // ),

          SizedBox(height:10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container( decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(30.0)),child: IconButton(onPressed: (){
                     openwhatsapp();
              }, icon:Icon(Icons.maps_ugc) ,color: Colors.blueGrey,iconSize: 35,)),
              SizedBox(width:30,),
              Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(30.0)),child: IconButton(onPressed: ()async{}, icon:Icon(Icons.call) ,color: Colors.blueGrey,iconSize: 35,)),
            ],
          ),
          // SizedBox(height: 20,),
          // Stack(
          //   children: [
          //     Center(
          //       child: Container(
          //         child: Center(child:_buildBody() ,),
          //         height: Get.height/24,
          //         width: Get.width/2.3,
          //         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(30.0)),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height:10,),
          InkWell(
            onTap: ()=>Get.to(Rating_doctor(widget.notes["image"],name1)),
            child: Stack(
              children: [
                Center(
                  child: Container(
                      child: Center(child: Text("Rating & Feedback",style: TextStyle(fontSize: 25,color: Colors.blueGrey,fontWeight: FontWeight.bold) ,),),
                    height: Get.height/18,
                    width: Get.width/1.5,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10.0)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
    Flexible(
      child: Container(
      child: FutureBuilder(
      future: notesref
          .where("name",
      isEqualTo: widget.notes['name'])
          .get(),
      builder: (context,snapshot) {
      if (snapshot.hasData) {
      return     SizedBox(height: Get.height/2,
      child: ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
      // String url =snapshot.data!.docs[index]['imageurl'];
      return
          Padding(
            padding: const EdgeInsets.all(10),


              child: Flexible(
                child: Container(

                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data!.docs[index]['feedback'],style: TextStyle(fontSize: 25,color: Colors.blueGrey,) ),
                  ),),

                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10.0)),
                ),
              ),




      );}));

      }
      return CircularProgressIndicator();
      })),
    ),


          // SizedBox(height: Get.height/2,child:ListView.builder(
          //   itemCount: ListOfFeedback.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return
          //       Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: ListOfFeedback.isNotEmpty?
          //         Center(
          //           child: Container(
          //             child: Center(child: Text("",style: TextStyle(fontSize: 25,color: Colors.blueGrey,fontWeight: FontWeight.bold) ,),),
          //             height: Get.height/5,
          //             width: Get.width/1.2,
          //             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10.0)),
          //           ),
          //         )
          //             :SizedBox(),
          //       );
          //   },
          //
          // ),),



        ],
      )
    );

  }
  openwhatsapp() async{
    var whatsapp ="${widget.notes['phone']}";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
         await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }

    }
    else{
    // android , web
    if( await canLaunch(whatsappURl_android)){
      await launch(whatsappURl_android);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));

    }


    // }

  }}

  Widget _buildBody() {
    final stars = List<Widget>.generate(5, (index) {

      return GetBuilder<RatingController>( // rebuilds when update() is called from GetX class
        builder: (controller) => Expanded(
          child: GestureDetector(
            child: controller.buildRatingStar(index),
            onTap: () {
              controller.updateAndStoreRating(index + 1); // +1 because index starts at 0 otherwise the star rating is offset by one
            },
          ),
        ),
      );
    });
    return Row(
      children: [
        Expanded(
          child: Row(

            children: stars,
          ),
        ),
        // Expanded(
        //   child: TextButton(
        //     onPressed: () {
        //       controller.updateAndStoreRating(0);
        //     },
        //     // child: Text(
        //     //   "Clear",
        //     //   style: TextStyle(color: Colors.black),
        //     // ),
        //   ),
        // ),
      ],
    );
  }

}
