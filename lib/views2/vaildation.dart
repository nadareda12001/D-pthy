import 'dart:convert';
import 'package:flutter_app/views2/stage0.dart';
import 'package:flutter_app/views2/stage2_screen.dart';
import 'package:flutter_app/views2/stage4_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/stage1_screen.dart';
import 'package:flutter_app/views2/stage3_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
class vaildation extends StatefulWidget {
  final notes;
  vaildation( {Key? key, this.notes}) : super(key: key);

  @override
  _vaildationState createState() => _vaildationState();
}

class _vaildationState extends State<vaildation> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("photos");

  uploudImage()async{
    final request=  http.MultipartRequest(
        'POST',Uri.parse("http://10.0.2.2:5000/predict"));
    Map<String,String> headers={"Content-type":"multipart/form-data"};
    request.files.add(http.MultipartFile('file',file!.readAsBytes().asStream(),
        file!.lengthSync(), filename:file!.path.split('/').last
    ));
    print(file);
    print(file!.path.split('.').last);
    request.headers.addAll(headers);
    print(request.toString());

    print(file!.readAsBytes().asStream().toString());
    final res =await request.send();
    var responseData=await res.stream.bytesToString();
    setState(() {
      result=jsonDecode(responseData)['class'];
      if("${result}"==0.toString()){
        Get.to(stage0());
      } if("${result}"==1.toString()){
        Get.to(stage1());
      } if("${result}"==2.toString()){
        Get.to(stage2());

      }if("${result}"==3.toString()){
        Get.to(stage3());

      } if("${result}"==4.toString()){
        Get.to(stage4());
      }
      else(){
          Get.to(stage0());
        };
    });

    print("re "+result.toString());
    print(res.statusCode);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 10),
      body: Padding(
        padding: EdgeInsets.only(top: 90),
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 50,right: 50),
              child: Container(

                height: Get.height/10,
                decoration: BoxDecoration(

                  borderRadius: BorderRadiusDirectional.circular(100),color: Colors.black26,),
                child: Center(
                child: Text("Vaildation",style: TextStyle(
                  color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
                ),),
              ),),
            ),
            SizedBox(height: Get.height/10,),
            Center(child:
        CircleAvatar(
                radius: Get.width/2.2,
                backgroundImage: imagePicked == null
                    ? null
                    : FileImage(
                  imagePicked!,
                ),
        )),



           SizedBox(height: Get.height/9,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  Stack(
                    children: [
                    CircleAvatar(
backgroundColor: Colors.white,
                      radius: 30,

                    ),
                      Center(child: IconButton(onPressed: () async {
                      // Navigator.of(context).pushNamed("homepage");

                    await  uploudImage();
                    image();

                      }, icon: Icon(Icons.done,size: 50,color: Colors.blueGrey),)) ,

                    ],
                  ),

                  SizedBox(width: Get.width/1.6,),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,

                      ),
                      Center(child: IconButton(onPressed: (){camera(context); }, icon: Icon(Icons.rotate_right_outlined,size: 40,color: Colors.blueGrey,)),) ,

                    ],
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
