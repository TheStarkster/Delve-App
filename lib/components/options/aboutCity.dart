import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';

class AboutCity extends StatefulWidget {
  @override
  _AboutCityState createState() => _AboutCityState();
}

class _AboutCityState extends State<AboutCity> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.blockSizeVertical * 46,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 12,
                      offset: Offset(0, 12),
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bombay.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Mumbai",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 48,
                          fontFamily: 'Raleway-Bold',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            "India",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'Raleway-Medium',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                padding: EdgeInsets.only(left: 12, right: 12, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 68,
                        height: SizeConfig.blockSizeVertical * 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(0xFFEAEAEA),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: const Alignment(-0.92, 0.0),
                                child: SizedBox(
                                  width: 0.0,
                                  height: 0.0,
                                  child: OverflowBox(
                                    maxWidth:
                                        SizeConfig.blockSizeHorizontal * 42,
                                    maxHeight:
                                        SizeConfig.blockSizeVertical * 30,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(28),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/gateway.jpg'),
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 14,
                                            offset: Offset(4, 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                // color: Colors.amber,
                                padding: EdgeInsets.only(
                                    top: 24, left: 12, right: 12, bottom: 12),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Text(
                                          "Gateway Of India",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Raleway-Medium',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Raleway-Regular',
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 68,
                        height: SizeConfig.blockSizeVertical * 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(0xFFEAEAEA),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: const Alignment(-0.92, 0.0),
                                child: SizedBox(
                                  width: 0.0,
                                  height: 0.0,
                                  child: OverflowBox(
                                    maxWidth:
                                        SizeConfig.blockSizeHorizontal * 42,
                                    maxHeight:
                                        SizeConfig.blockSizeVertical * 30,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(28),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/caves.png'),
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 14,
                                            offset: Offset(4, 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                // color: Colors.amber,
                                padding: EdgeInsets.only(
                                    top: 24, left: 12, right: 12, bottom: 12),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Text(
                                          "Elephanta Caves",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Raleway-Medium',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Raleway-Regular',
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
