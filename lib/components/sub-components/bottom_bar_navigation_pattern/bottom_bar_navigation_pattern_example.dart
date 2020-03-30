import 'package:flutter_app/components/about_city.dart';
import 'package:flutter_app/components/agenda.dart';
import 'package:flutter_app/components/queries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/contact.dart';
import 'package:flutter_app/components/profile.dart';
import 'package:flutter_app/components/sub-components/animatedbutton/animated_button.dart';

class BottomBarNavigationPatternExample extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.red,
    ),
    BarItem(
      text: "Update",
      iconData: Icons.update,
      color: Colors.red,
    ),
    BarItem(
      text: "notification",
      iconData: Icons.notifications,
      color: Colors.red,
    ),
  ];
  @override
  _BottomBarNavigationPatternExampleState createState() =>
      _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState
    extends State<BottomBarNavigationPatternExample> {
  int selectedBarIndex = 0;
  var image = "assets/images/abc.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(80, 40, 0, 0),
                        child: Text(
                          'welcome',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 35, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.blueGrey,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage('assets/images/abc.jpg'),
                            ),
                          ),
                          child: Image.network(
                            image,
                            height: 100,
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(80, 55, 0, 0),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 23, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 130, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Events',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 155, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'All Events',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 210, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 390,
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    new AssetImage('assets/images/abc.jpg'))),
                        child: Image.network(
                          image,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 470, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Venue',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 510, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'address',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 590, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Options',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 650, 10, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.blueGrey,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new AssetImage(
                                          'assets/images/abc.jpg'))),
                              child: Image.network(
                                image,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => City(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blueGrey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage(
                                            'assets/images/abc.jpg'))),
                                child: Image.network(
                                  image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 850, 10, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.blueGrey,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new AssetImage(
                                          'assets/images/abc.jpg'))),
                              child: Image.network(
                                image,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Contact(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blueGrey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage(
                                            'assets/images/abc.jpg'))),
                                child: Image.network(
                                  image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 1050, 10, 0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Queries(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blueGrey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage(
                                            'assets/images/abc.jpg'))),
                                child: Image.network(
                                  image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Agenda(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blueGrey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage(
                                            'assets/images/abc.jpg'))),
                                child: Image.network(
                                  image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 200),
          barStyle: BarStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            iconSize: 35,
          ),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }),
    );
  }
}
