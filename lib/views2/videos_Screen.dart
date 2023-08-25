import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, 10),
      appBar: AppBar(backgroundColor: Color.fromRGBO(96, 125, 139, 10),title: Text("Videos",style: TextStyle(fontSize: 30),),centerTitle: true),
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('videos').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                var url = document['url'];

                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url!)!,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    disableDragSeek: false,
                    loop: false,
                    isLive: false,
                    forceHD: false,
                  ),
                );

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  margin: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 10),
                  elevation: 7,
                  child: Container(
                    // decoration: BoxDecoration(border: Border.all(width: 2),
                    // borderRadius: BorderRadius.circular(12),
                    //   ),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, top: 7, right: 5, bottom: 2.5),
                          child: Text(document['title'],
                              style: GoogleFonts.quicksand(
                                  fontStyle: FontStyle.normal)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, top: 5, right: 5, bottom: 5),
                          child: Container(
                            child: YoutubePlayer(
                              controller: _controller,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
