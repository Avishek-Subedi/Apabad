import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  Widget _buildMembers(
      BuildContext context, DocumentSnapshot document, String collectionName) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 28),
              CircleAvatar(
                backgroundImage: NetworkImage(document['photoUrl']),
                radius: 50,
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(document['fburl'])) {
                        await launch(document['fburl']);
                      } else {
                        throw 'Could not launch ';
                      }
                    },
                    child: Icon(
                      LineAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    LineAwesomeIcons.instagram,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 4),
                  Icon(LineAwesomeIcons.twitter, color: Colors.blue)
                ],
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  document['description'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
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
                          Firestore.instance.collection('Users').snapshots(),
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
                          itemBuilder: (context, index) => _buildMembers(
                              context, snapshot.data.documents[index], 'Users'),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),

      /// List View
    );
  }
}

/////// creating method
