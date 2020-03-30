import 'package:flutter/material.dart';
import 'package:flutter_app/components/home.dart';

class Profile extends StatelessWidget {
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
  var image1 = "assets/image/abc.jpg";
  var image2 = "assets/images/download.png";

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
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Text(
                                'Profile & Tickets',
                                style: TextStyle(
                                    fontSize: 26, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
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
                        margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(150)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new AssetImage(
                                          'assets/images/abc.jpg'))),
                              child: Image.network(
                                image1,
                                height: 100,
                                width: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 380, 0, 0),
                              child: Text(
                                'Ankit Yadav',
                                style: TextStyle(
                                    fontSize: 26, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 410, 0, 0),
                              child: Text(
                                'sacramentogreen18@gmail.com',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 440, 0, 0),
                              child: Text(
                                'employee of xyz',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 480, 0, 0),
                              child: Text(
                                'Tickets',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 530, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 380,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'From Delhi To Mumbai',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: new AssetImage(
                                                      'assets/images/download.png'))),
                                          child: Image.network(
                                            image2,
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 630, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 380,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'From Mumbai To Delhi',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: new AssetImage(
                                                      'assets/images/download.png'))),
                                          child: Image.network(
                                            image2,
                                            height: 10,
                                            width: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
