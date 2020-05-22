import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  //

  Widget _buildmusic(
      BuildContext context, DocumentSnapshot document, String collectionName) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200, right: 50, left: 50),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              document['SongPic'],
              fit: BoxFit.fill,
            ),
          ),
          InkWell(
            onTap: () async {
              if (await canLaunch(document['SongUrl'])) {
                await launch(document['SongUrl']);
              } else {
                throw 'Could not launch ';
              }
            },
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.circular(20)),
              child: Text("Click Here to listen"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff1C1C1C),
        scaffoldBackgroundColor: Color(0xff1C1C12),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('music').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return LinearProgressIndicator(
                            backgroundColor: Colors.black12,
                          );
                        if (snapshot.data == null)
                          return LinearProgressIndicator(
                            backgroundColor: Colors.black12,
                          );
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) => _buildmusic(
                              context, snapshot.data.documents[index], 'music'),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),

      ////
    );
  }
}
