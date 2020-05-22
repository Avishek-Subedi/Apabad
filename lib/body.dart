import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'Members.dart';
import 'music.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff1C1C1C),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white12,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        15.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                height: 125,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xff1C1C12),
                      backgroundImage: AssetImage("lib/images/logo.png"),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        height: 40,
                        margin: EdgeInsets.only(left: 50, right: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 30, bottom: 10),
                              hintText: "Search Here...",
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                      ),
                      margin: EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 18),
              // CircleAvatar(
              //   radius: 21,
              //   backgroundColor: Colors.white,
              //   child: InkWell(
              //     onTap: () {},
              //     child: Icon(
              //       Icons.home,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(seconds: 3),
                  dotSize: 2,
                  dotIncreasedColor: Colors.white,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  images: [
                    Image.asset(
                      "lib/images/1.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/images/2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/images/4.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/images/5.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff1C1C1C),
                    borderRadius: BorderRadius.circular(20)),
                height: 70,
                width: double.infinity,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.people),
                      text: "Members",
                    ),
                    Tab(
                      icon: Icon(Icons.music_note),
                      text: "Music",
                    ),
                  ],
                ),
              ),

              Container(
                height: 500,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Members(),
                    Music(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
