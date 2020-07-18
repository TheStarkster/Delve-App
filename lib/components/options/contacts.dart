import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import 'package:intent/action.dart' as IntentActions;
import 'package:intent/intent.dart' as IntentService;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
                  "Contacts",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 12),
          child: Column(
            children: List.generate(eventRepresentatives.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 14,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.person),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              eventRepresentatives[index]["Employees"]["name"],
                              style: TextStyle(
                                fontFamily: 'Raleway-Medium',
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              eventRepresentatives[index]["Employees"]["phone"],
                              style: TextStyle(
                                fontFamily: 'Raleway-Regular',
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              eventRepresentatives[index]
                                  ["Representative_Categories"]["name"],
                              style: TextStyle(
                                fontFamily: 'Raleway-Regular',
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () => IntentService.Intent()
                          ..setAction(IntentActions.Action.ACTION_DIAL)
                          ..setData(Uri(
                              scheme: 'tel',
                              path: eventRepresentatives[index]["Employees"]
                                  ["phone"]))
                          ..startActivity().catchError((e) => print(e)),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 14,
                            right: 14,
                          ),
                          child: Text(
                            "Call",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Raleway-Regular',
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black12,
                          ),
                        ),
                      ),)
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
