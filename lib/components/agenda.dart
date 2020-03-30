import 'package:flutter/material.dart';
import 'package:flutter_app/components/home.dart';

class Agenda extends StatelessWidget {
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
  var image = "assets/image/arrow.png";

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
                              'Agenda',
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
                                    BorderRadius.all(Radius.circular(40)),
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
                      padding: EdgeInsets.fromLTRB(0, 370, 0, 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.blueGrey[100],
                              ),
                            ),
                          ],
                        ),
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 470, 0, 0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'VRM Unplugged',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Dress Code: Indo-Western Outfit',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            '11:30 - 12:30 pm GMT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '(10:30 IST)',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              width: 350,
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'VRM Unplugged',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Dress Code: Indo-Western Outfit',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            '11:30 - 12:30 pm GMT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '(10:30 IST)',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              width: 350,
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'VRM Unplugged',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Dress Code: Indo-Western Outfit',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            '11:30 - 12:30 pm GMT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '(10:30 IST)',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                            textAlign: TextAlign.left,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              width: 350,
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blueGrey[100]),
                            ),
                          ],
                        ),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
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
