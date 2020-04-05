import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';

class Querie extends StatefulWidget {
  @override
  _QuerieState createState() => _QuerieState();
}

class _QuerieState extends State<Querie> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Queries",
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Raleway-Regular',
                    color: Colors.black,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              "Submit You Query, We will Try To Contact Or Answer you Query as Soon as Possible",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway-Light',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8, right: 18, left: 18),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.only(left: 12),
                hintText: "Ask Here",
                hintStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontFamily: 'Raleway-Light',
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(18),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    height: 45,
                    onPressed: () {},
                    shape: StadiumBorder(),
                    color: Color(0xFF2E375C),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Raleway-Light',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, left: 21, right: 21),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      "Recent Queries",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Raleway-Medium',
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Raleway-Medium',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    children: <Widget>[
                      Text(
                        "Query answered dummy text of the printing",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway-Light',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
