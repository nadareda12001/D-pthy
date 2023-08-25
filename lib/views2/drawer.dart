import 'dart:ui';
import 'package:flutter_app/views2/article_Screen.dart';
import 'package:flutter_app/views2/videos_Screen.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models2/constants/color.dart';
import 'package:get/get_core/src/get_main.dart';

import '../allusers.dart';


class drawerscreen extends StatelessWidget {
  drawerscreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(35), bottomRight: Radius.circular(35), ),
          child:Drawer(
              width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(height: 200,width: 220,color: Colors.blueGrey,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top:40),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "images/logo.png",
                        //height: 100,
                      ),
                        radius: 40,
                        )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:140,left: 10),
                    child: Text("Welcom",style: TextStyle(color:Colors.white,fontSize: 30)),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: ExpansionTile(
                  title:
                  Text("Awareness", style: TextStyle(color: Colors.blueGrey)),
                  leading: const Icon(Icons.wb_incandescent,
                      color: Colors.blueGrey), //add icon
                  childrenPadding: EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      textColor: Colors.blueGrey,
                      leading: const Icon(Icons.ondemand_video,
                          color: Colors.blueGrey),
                      title: Text("Videos"),
                      onTap: () {
                        Get.to(VideoScreen());
                        //action on press
                      },
                    ),

                    ListTile(
                      textColor: Colors.blueGrey,
                      leading: const Icon(Icons.article, color: Colors.blueGrey),
                      title: Text("Articles"),
                      onTap: () {
                        Get.to(ArticleScreen());
                        //action on press
                      },
                    ),
                    //more child menu
                  ],
                )
              ),
              ListTile(
                textColor:Colors.blueGrey ,
                iconColor: Colors.blueGrey ,
                leading: const Icon(Icons.accessibility_new_rounded),
                title: const Text("Doctors",),
                onTap: (){
                  Get.toNamed('Recommendation');
                },
              ),
              ListTile(
                textColor:Colors.blueGrey ,
                iconColor: Colors.blueGrey ,
                leading: const Icon(Icons.settings_rounded),
                title: const Text("Setting",),
                onTap: (){
                  Get.to(two2());
                },
              ), ListTile(
                textColor:Colors.blueGrey ,
                iconColor: Colors.blueGrey,
                leading: const Icon(Icons.share),
                title: const Text("Share this app",),
                onTap: (){
                  Get.toNamed('testscreen');
                },
              ),
            ],

          )
    ),
    );
  }
}

