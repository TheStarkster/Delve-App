import 'package:flutter/material.dart';
import 'package:flutter_app/components/home.dart';

class City extends StatelessWidget {
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
  var image = "assets/images/arrow.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 45, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new AssetImage(
                                          'assets/images/arrow.png'))),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Text(
                              'About City',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 400,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 400, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Colors.yellow),
                                ),
                                Container(
                                  width: 250,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                            width: 400,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 700, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    width: 130,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.yellow),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            width: 400,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
