import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views2/control.dart';
import 'package:flutter_app/views2/drawer.dart';
import 'package:flutter_app/views2/exercise.dart';
import 'package:flutter_app/views2/smoking.dart';
import 'package:flutter_app/views2/strees.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Advices extends StatefulWidget {
  const Advices({Key? key}) : super(key: key);

  @override
  _AdvicesState createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
  List Images =["images/advice (1).jpg","images/advice (2).jpg","images/advice (3).jpg","images/advice (4).jpg"];
  List dis=[" If you have high blood pressure, do your best to lower it","Daily exercise improves your circulation","Stress can cause your blood pressure to shoot up.","Any form of tobacco is a source of cyanide."];
 List pages=[stress_advice(),exercis_advice(),control_advice(),smoking_advice(),];
  List advices =["Control Your Blood Pressure","Exercise Regularly","Avoid Stress","Stop Smoking"].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blueGrey,title: Text("Advices",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),),centerTitle: true,),
    //  drawer: drawerscreen(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: advices.length,
          itemBuilder: (BuildContext context, int index) {
            return
               Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(

                     // overflow: Overflow.visible,
                      alignment: AlignmentDirectional.topCenter,
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: Get.height/2.5,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                        ),
                        Positioned(

        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),

              child: Image.asset(Images[index],fit: BoxFit.cover,width: Get.width,)
            ),
            SizedBox(height: 20,),
            Text(advices[index].toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 25),),

            SizedBox(height: 15,),
            Text(dis[index],style: TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(height: 5,),
            //Text("what where wrryy gghj bhhj jjj ggf",style: TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(height: 5,),
            Container(
                height: Get.height/16,
                width: Get.width,
                decoration: BoxDecoration(color: Color.fromRGBO(96, 125, 139, 10),borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
                child: TextButton(onPressed: (){Get.to(pages[index]);}, child: Text("More ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                  //style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.purple,)
                ),)),
          ],
        ),


                        )
                      ],
                    ));
          },

        ),
      ),
    );
  }
}
