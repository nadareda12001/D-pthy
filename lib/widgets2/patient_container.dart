import 'package:flutter/material.dart';
import 'package:flutter_app/views2/profile_patient.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models2/constants/color.dart';
class patient_container extends StatelessWidget {
  const patient_container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        fit: StackFit.loose,
        children: [
          Container(
            width: Get.width/2,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(30.0)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.perm_identity_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                    radius: 40,
                    backgroundColor: Colors.blueGrey,

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Name",style: TextStyle(color: Colors.blueGrey,fontSize: 25)),
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                      height: Get.height/16,
                      width: Get.width/1.5,
                      decoration: BoxDecoration(color: Color.fromRGBO(96, 125, 139, 10),borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                      child: TextButton(onPressed: (){Get.to(patient_profile());}, child: Text("View Profile",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                        //style: ElevatedButton.styleFrom(
                        //   backgroundColor: Colors.purple,)
                      ),)),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
