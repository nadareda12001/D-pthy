import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models2/constants/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class stress_advice extends StatefulWidget {
  const stress_advice({Key? key}) : super(key: key);

  @override
  _stress_adviceState createState() => _stress_adviceState();
}

class _stress_adviceState extends State<stress_advice> {

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
                  child: Center(child: Container(child: Center(child: Text("Control Your Blood Pressure",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center)))),
                )),
                Expanded(
                  flex: 2,
                  child: Text(" If you have high blood pressure, do your best to lower it. You can take medications and reduce the stress levels in your home or workplace. Uncontrolled blood pressure can result in the bursting of thin blood vessels in your eyes.",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center),
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
                      onPressed: ()  {
                        {
                          Get.back();
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