import 'package:delve_app/components/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(DelveApp());

class DelveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginAndVerify(),
    );
  }
}

class LoginAndVerify extends StatefulWidget {
  LoginAndVerify({Key key}) : super(key: key);
  @override
  _LoginAndVerifyState createState() => _LoginAndVerifyState();
}

class _LoginAndVerifyState extends State<LoginAndVerify> {
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
                    controller: pageController,
                    children: <Widget>[
                      EventCodeView(pageController),
                      MobileNumberView(pageController),
                      OTPView(),
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
  PageController pageController;
  EventCodeView(this.pageController);
  @override
  _EventCodeViewState createState() => _EventCodeViewState();
}

class _EventCodeViewState extends State<EventCodeView> {
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
                  onPressed: () {
                    widget.pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
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
  PageController pageController;
  MobileNumberView(this.pageController);
  @override
  _MobileNumberViewState createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {
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
                  onPressed: () {
                    widget.pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
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
  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
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
