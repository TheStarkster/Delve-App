import 'package:delve_app/components/home.dart';
import 'package:delve_app/models/event.dart';
import 'package:delve_app/models/user.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:delve_app/utils/repository/api/constants.dart';
import 'package:delve_app/utils/repository/api/handlers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => ApiConstants());
}
SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  prefs = await SharedPreferences.getInstance();
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserContext(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventContext(),
        ),
      ],
      child: DelveApp(prefs),
    ),
  );
}

class DelveApp extends StatelessWidget {
  final SharedPreferences prefs;
  DelveApp(this.prefs);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
       prefs.getBool("isLoggedIn") == null
          ? LoginAndVerify()
          : prefs.getBool("isLoggedIn") ? Home() : LoginAndVerify(),
    );
  }
}

class LoginAndVerify extends StatefulWidget {
  LoginAndVerify({Key key}) : super(key: key);
  @override
  _LoginAndVerifyState createState() => _LoginAndVerifyState();
}

class _LoginAndVerifyState extends State<LoginAndVerify> {
  UserContext userContext;
  @override
  void initState() {
    super.initState();
    userContext = Provider.of<UserContext>(context, listen: false);
  }

  PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Expanded(
                  flex: 8,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: <Widget>[
                      EventCodeView(pageController, userContext),
                      MobileNumberView(pageController, userContext),
                      OTPView(userContext),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventCodeView extends StatefulWidget {
  final PageController pageController;
  final UserContext userContext;
  EventCodeView(this.pageController, this.userContext);
  @override
  _EventCodeViewState createState() => _EventCodeViewState();
}

class _EventCodeViewState extends State<EventCodeView> {
  TextEditingController _eventCode = new TextEditingController();
  ApiConstants get apiconstants => GetIt.I<ApiConstants>();
  ApiHandlers apiHandlers = new ApiHandlers();
  EventContext eventContext;
  @override
  void initState() {
    super.initState();
    eventContext = Provider.of<EventContext>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(43),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 28,
            ),
            Text(
              "Please Enter",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway-Regular',
                fontSize: 30,
              ),
            ),
            Text(
              "The Event Code",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway-Light',
                fontSize: 21,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 34, top: 8),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                cursorColor: Color(0xFF080F2F),
                controller: _eventCode,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  elevation: 0.0,
                  minWidth: 150,
                  height: 42,
                  onPressed: () async {
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
                    var result = await apiHandlers.getEvent(_eventCode.text);
                    Navigator.pop(context);
                    if (result != 0) {
                      await prefs.setString("EventId", _eventCode.text);
                      eventContext.setEvent(Event.fromJSON(result));
                      widget.pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 1200),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("No Such Event"),
                              content: Text(
                                "The Event in you're trying to login in to is not available, double check your input",
                              ),
                            );
                          });
                    }
                  },
                  color: Color(0xFF2E375C),
                  shape: StadiumBorder(),
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Raleway-Medium',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNumberView extends StatefulWidget {
  final PageController pageController;
  final UserContext userContext;
  MobileNumberView(this.pageController, this.userContext);
  @override
  _MobileNumberViewState createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {
  TextEditingController _eventAttendee = new TextEditingController();
  ApiHandlers apiHandlers = new ApiHandlers();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(43),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.transparent,
              size: 28,
            ),
            Text(
              "Please Enter",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway-Regular',
                fontSize: 30,
              ),
            ),
            Text(
              "Registered Mobile Number",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway-Light',
                fontSize: 21,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 34, top: 8),
              child: TextField(
                controller: _eventAttendee,
                style: TextStyle(color: Colors.white, fontSize: 18),
                cursorColor: Color(0xFF080F2F),
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: 150,
                  elevation: 0.0,
                  height: 42,
                  onPressed: () async {
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
                    var result = await apiHandlers.checkIfNumberExists(
                        prefs.getString("EventId"), _eventAttendee.text);
                    Navigator.pop(context);
                    if (result != 0) {
                      widget.userContext.setUser(User.fromJSON(result));
                      await prefs.setString("phone", _eventAttendee.text);
                      widget.pageController.animateToPage(
                        2,
                        duration: Duration(milliseconds: 1200),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Cannot Login"),
                              content: Text(
                                "You are Not Registered for this Event, Please contact adminsitator",
                              ),
                            );
                          });
                    }
                  },
                  color: Color(0xFF2E375C),
                  shape: StadiumBorder(),
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Raleway-Medium',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OTPView extends StatefulWidget {
  final UserContext userContext;
  OTPView(this.userContext);
  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final FirebaseMessaging _messaging = new FirebaseMessaging();
  ApiHandlers apiHandlers = new ApiHandlers();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(43),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.transparent,
              size: 28,
            ),
            Text(
              "Please Enter OTP",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway-Regular',
                fontSize: 30,
              ),
            ),
            Text(
              "Registered Mobile Number",
              style: TextStyle(
                color: Colors.transparent,
                fontFamily: 'Raleway-Light',
                fontSize: 21,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 34, top: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: 150,
                  elevation: 0.0,
                  height: 42,
                  onPressed: () async {
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
                    var token = await _messaging.getToken();
                    await apiHandlers.saveFcmToken(token, widget.userContext.user.id.toString());
                    Navigator.pop(context);
                    prefs.setBool("isLoggedIn",true)
                    .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    ),);
                  },
                  color: Color(0xFF2E375C),
                  shape: StadiumBorder(),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Raleway-Medium',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
