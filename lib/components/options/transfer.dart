import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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
                  "Transfer",
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
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 70),
              child: TabBar(
                  indicatorWeight: 6,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 4,
                    ),
                    insets: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "12",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontFamily: 'Raleway-Medium',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "Mon",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Raleway-Light',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "13",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontFamily: 'Raleway-Medium',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "Tue",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Raleway-Light',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "14",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontFamily: 'Raleway-Medium',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "Wed",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Raleway-Light',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "15",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontFamily: 'Raleway-Medium',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "Thu",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Raleway-Light',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 32, bottom: 12, left: 16),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Pickups",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'Raleway-Regular',
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 18, left: 12, right: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "To Holiday Inn Anderi",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Raleway-Medium',
                                    fontSize: 21,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "From XYZ Airport Terminal II",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Raleway-Medium',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  child: Container(
                                    width: 80,
                                    height: 4,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                                Text(
                                  "BUS - MH 007FXX",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Raleway-Regular',
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3, bottom: 8),
                                  child: Text(
                                    "Driver Name",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "995546XXXX",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            left: 14,
                                            right: 14),
                                        child: Text(
                                          "Call",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Raleway-Regular'),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 21,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Arrival",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "10:30 am",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Departure",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "12:30 pm",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                  ),
                  Container(),
                  Container(),
                  Container(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
