import 'package:flutter/material.dart';

import 'body.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff1C1C1C),
        scaffoldBackgroundColor: Color(0xff292929),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      home: FirstPage(),
    ),
  );
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    30.0, // Move to right 10  horizontally
                    20.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            height: 50,
            width: double.infinity,
            child: Center(
                child: Text(
              "Welcome to Apabad!!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
          ),
        ),
      ),
    );
  }
}
