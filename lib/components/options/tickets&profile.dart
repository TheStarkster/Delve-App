import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class ProfileTickets extends StatefulWidget {
  @override
  _ProfileTicketsState createState() => _ProfileTicketsState();
}

class _ProfileTicketsState extends State<ProfileTickets> {
  UserContext userContext;
  EventContext eventContext;
  List<dynamic> eventRepresentatives;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
    eventRepresentatives = eventContext.event.eventRepresentatives;
  }

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
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: SizeConfig.blockSizeVertical * 7,
                    child: Center(
                      child: Icon(Icons.person,size: SizeConfig.blockSizeVertical * 6,color: Colors.white60,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      userContext.user.name,
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
                      userContext.user.phone,
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
                  userContext.user.dticket != null ?
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    userContext.user.aTicketFrom,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(Icons.swap_horiz),
                                  Text(
                                    userContext.user.aTicketTo??"City",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
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
                              Row(
                                children: [
                                  Text(
                                    userContext.user.dTicketFrom,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(Icons.swap_horiz),
                                  Text(
                                    userContext.user.dTicketTo??"City",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
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
                  )
                  :
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    userContext.user.aTicketFrom,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Icon(Icons.swap_horiz),
                                  SizedBox(width: 8,),
                                  Text(
                                    userContext.user.aTicketTo,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor: new AlwaysStoppedAnimation<Color>(
                                            Color(0xFF080F2F),
                                          ),
                                        ),
                                      );
                                    });
                                  var file = await DefaultCacheManager().getSingleFile(userContext.user.aticket);
                                  await OpenFile.open(file.path);
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  child: Image.asset('assets/images/download_icon.png'),
                                  backgroundColor: Colors.black12,
                                ),
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
