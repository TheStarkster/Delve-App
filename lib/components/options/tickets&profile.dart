import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';

class ProfileTickets extends StatefulWidget {
  @override
  _ProfileTicketsState createState() => _ProfileTicketsState();
}

class _ProfileTicketsState extends State<ProfileTickets> {
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
                  "Profile & Tickets",
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
            padding: EdgeInsets.only(top: 38),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/user.png',
                    width: SizeConfig.blockSizeVertical * 21,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      "Arthur Cooper",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway-Regular',
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "jeff.brown@example.com",
                      style: TextStyle(
                        color: Colors.black45,
                        fontFamily: 'Raleway-Regular',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 18),
                    child: Container(
                      width: 50,
                      height: 2,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Employeed at",
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Raleway-Regular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black12,
                    ),
                    child: Text(
                      "Company Name",
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Raleway-Regular',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 12),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Tickets",
                          style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Raleway-Regular',
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "From Delhi To Mumbai",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Raleway-Regular',
                                  fontSize: 18,
                                ),
                              ),
                              CircleAvatar(
                                child: Image.asset(
                                    'assets/images/download_icon.png'),
                                backgroundColor: Colors.black12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE4E4E4),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "From Mumbai To Delhi",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Raleway-Regular',
                                  fontSize: 18,
                                ),
                              ),
                              CircleAvatar(
                                child: Image.asset(
                                    'assets/images/download_icon.png'),
                                backgroundColor: Colors.black12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE4E4E4),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 8),
                              )
                            ],
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
    );
  }
}
