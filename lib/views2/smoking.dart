import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models2/constants/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class smoking_advice extends StatefulWidget {
  const smoking_advice({Key? key}) : super(key: key);

  @override
  _smoking_adviceState createState() => _smoking_adviceState();
}

class _smoking_adviceState extends State<smoking_advice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueGrey,elevation: 0),
        backgroundColor: Colors.blueGrey,
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex:1,child: Padding(
                    padding: const EdgeInsets.only(top:70),
                    child: Center(child: Container(child: Center(child: Text("Stop Smoking",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center)))),
                  )),
                  Expanded(
                    flex: 2,
                    child: Text(" Any form of tobacco is a source of cyanide. This toxic material can destroy the cells in your eyes. Studies also show that tobacco impedes the proper circulation and oxygenation of blood. Stop smoking, and you will ensure the health of your eyes and your entire body.",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center),
                  ),
                  //Expanded(child: Row(children: [],))
                  Expanded(flex:1,child:  Container(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                        color: Colors.white,
                        splashColor: Colors.white,
                        height: 50,
                        minWidth: Get.width/3 ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'Skip',
                          style:  TextStyle( fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,),
                        ),
                        onPressed: () async {
                          {
                            Get.to(Advices());
                          }
                        }),
                  ),),
                ],
              ),
            ),
          ),
        )
    );
  }
}