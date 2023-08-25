import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';


class ArticleScreen extends StatefulWidget {
  ArticleScreen({super.key});

  @override
  ArticleScreenState createState() => ArticleScreenState();
}

class ArticleScreenState extends State<ArticleScreen> {
  ArticleScreenState();

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 10),
      appBar: AppBar(backgroundColor: Color.fromRGBO(96, 125, 139, 10),title: Text("Articles",style: TextStyle(fontSize: 30),),centerTitle: true),


      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Articles').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  margin: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        _launchURL(document['url']);
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 7, right: 5, bottom: 2.5),
                            child: Text(document['title'], style: GoogleFonts.quicksand(
                                fontStyle: FontStyle.normal)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 5, top: 7, right: 5, bottom: 2.5),
                              child: CachedNetworkImage(
                                imageUrl: document['image'],
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: Color.fromARGB(255, 65, 100, 117),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
