import 'package:delve/components/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              new Image(
                image: new AssetImage(
                  "assets/images/logo.png",
                ),
                width: 350,
                height: 300,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: pageController,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: new Image(
                              image: new AssetImage(
                                  "assets/images/calender_logo.png"),
                              width: 30,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(70, 8, 110, 0),
                                  child: Text(
                                    'Please Enter',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(70.0, 8.0, 140, 0.0),
                            child: Text(
                              'The Event Code',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                minWidth: 250,
                                onPressed: () {
                                  pageController.animateToPage(1,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                },
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'ENTER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.purple[900],
                                shape: StadiumBorder(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
                                  child: Text(
                                    'Please Enter',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(70.0, 5.0, 00, 0.0),
                                  child: Text(
                                    'Registered Mobile Number',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white70),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(70, 27, 70, 0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                minWidth: 250,
                                onPressed: () {
                                  pageController.animateToPage(2,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                },
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Verify',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.purple[900],
                                shape: StadiumBorder(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
                                    child: Text(
                                      'Please Enter OTP',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(70, 53, 70, 0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: '',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MaterialButton(
                                  minWidth: 250,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'LOGIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Colors.purple[900],
                                  shape: StadiumBorder(),
                                )
                              ],
                            )
                          ],
                        ))
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
