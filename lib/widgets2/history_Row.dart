import 'package:flutter/material.dart';
import '../models2/constants/color.dart';
class result_Row extends StatelessWidget {
  const result_Row({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
            width:  MediaQuery. of(context). size. width ,
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  // child: Icon(Icons.perm_identity_sharp,size: 60,color: Colors.lightBlue,),
                  radius: 40,
                  backgroundColor: Colors.blueGrey,),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      Text("19/11/2022",style: TextStyle(color:Colors.lightBlue,fontSize: 20),),
                      SizedBox(height: 5,),
                      Text("type 2",style: TextStyle(color:Colors.lightBlue,fontSize: 20),),
                      SizedBox(height: 5,),
                      Text("left eye",style: TextStyle(color:Colors.lightBlue,fontSize: 20),),
                    ],
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );

  }
}
