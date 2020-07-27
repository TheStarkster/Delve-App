import 'package:cached_network_image/cached_network_image.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:delve_app/components/options/aboutCity.dart';
import 'package:delve_app/components/options/agendas.dart';
import 'package:delve_app/components/options/contacts.dart';
import 'package:delve_app/components/options/queries.dart';
import 'package:delve_app/components/options/tickets&profile.dart';
import 'package:delve_app/components/options/transfer.dart';
import 'package:delve_app/components/sub-components/agendaCard.dart';
import 'package:delve_app/main.dart';
import 'package:delve_app/models/event.dart';
import 'package:delve_app/models/user.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:delve_app/utils/repository/api/handlers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  TabController tabBarController;
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  ApiHandlers apiHandlers = ApiHandlers();
  List<Tabs> tabs = new List();
  bool isReady;
  @override
  void initState() {
    isReady = false;
    super.initState();
    currentPage = 0;
    tabs.add(Tabs(Icons.home, "Home", Colors.orange));
    tabs.add(Tabs(Icons.history, "Recent", Colors.pink));
    tabs.add(
        Tabs(Icons.notifications_active, "Notification", Colors.blueAccent));
    tabBarController =
        new TabController(initialIndex: currentPage, length: 3, vsync: this);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  UserContext userContext;
  EventContext eventContext;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
    if (!isReady) {
      setContext().then((value) {
        setState(() {
          isReady = !isReady;
        });
      });
    }
  }

  Future setContext() async {
    var eventResult = await apiHandlers.getEvent(prefs.getString("EventId"));
    eventContext.setEvent(Event.fromJSON(eventResult));
    var userResult = await apiHandlers.checkIfNumberExists(
        prefs.getString("EventId"), prefs.getString("phone"));
    userContext.setUser(User.fromJSON(userResult));
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isReady
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProfileTickets(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 50,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome,",
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontFamily: 'Raleway-Medium',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        userContext.user.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway-Regular',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CubertoBottomBar(
              inactiveIconColor: inactiveColor,
              tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
              selectedTab: currentPage,
              tabs: tabs
                  .map((value) => TabData(
                        iconData: value.icon,
                        title: value.title,
                        tabColor: value.color,
                      ))
                  .toList(),
              onTabChangedListener: (position, title, color) {
                setState(() {
                  tabBarController.animateTo(position);
                  currentPage = position;
                });
              },
            ), //
            body: TabBarView(
              controller: tabBarController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeTab(),
                RecentTab(),
                NotificationTab(),
              ],
            ),
          )
        : Container();
  }
}

//Home tab Starts Here.....
class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  UserContext userContext;
  EventContext eventContext;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Events",
                  style: TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 18,
                    fontFamily: 'Raleway-Regular',
                  ),
                ),
                Text(
                  eventContext.event.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontFamily: 'Raleway-Medium',
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Agenda(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'eventHero',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: CachedNetworkImage(
                            imageUrl: eventContext.event.eventImage,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Color(0xFF080F2F),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 8,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Venue",
                  style: TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 18,
                    fontFamily: 'Raleway-Regular',
                  ),
                ),
                Text(
                  eventContext.event.location["name"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontFamily: 'Raleway-Medium',
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL(eventContext.event.location["url"]),
                  child: Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.black45),
                        Text(
                          "Tap To See Location",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Options",
                  style: TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 18,
                    fontFamily: 'Raleway-Regular',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProfileTickets(),
                            ),
                          );
                        },
                        child: Container(
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/tickets.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "Profile & Tickets",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Transfer(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "Transfer",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/transfer.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AboutCity(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "About City",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/about_city.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Contact(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "Contacts",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/contacts.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Querie(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "Query",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/query.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Agenda(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 38),
                                child: Text(
                                  "Agendas",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Raleway-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: SizeConfig.blockSizeVertical * 20,
                          height: SizeConfig.blockSizeVertical * 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/agendas.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Home tab Ends Here.....

//Recent tab Starts Here.....
class RecentTab extends StatefulWidget {
  @override
  _RecentTabState createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  UserContext userContext;
  EventContext eventContext;
  List<DateTime> agendaDates;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
    agendaDates = eventContext.event.agendas
        .map((a) => DateTime.parse(a["startDate"]))
        .toSet()
        .toList();
  }
  String getDay(int dayInt){
    switch (dayInt) {
      case 1:
        return "Mon";
        break;
      case 2:
        return "Tue";
        break;
      case 3:
        return "Wed";
        break;
      case 4:
        return "Thu";
        break;
      case 5:
        return "Fri";
        break;
      case 6:
        return "Sat";
        break;
      case 7:
        return "Sun";
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 24),
                child: Scaffold(
                  body: DefaultTabController(
                    length: agendaDates.length,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 70),
                          child: TabBar(
                            indicatorWeight: 6,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorPadding:
                                EdgeInsets.symmetric(horizontal: 10),
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
                            tabs: List.generate(agendaDates.length, (index) {
                              return Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints:
                                      BoxConstraints.expand(width: 100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        agendaDates[index].day.toString(),
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text(
                                          getDay(agendaDates[index].weekday),
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
                              );
                            }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TabBarView(
                              children: List.generate(agendaDates.length, (index) {
                                List<Map<String,dynamic>> agendas = eventContext.event.agendas.where((e) => DateTime.parse(e["startDate"]) == agendaDates[index]).map<Map<String,dynamic>>((e) => e).toList();
                                return Day(
                                  agendas,
                                  true
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
//Recent tab Ends Here.....

//NotificationTab tab Starts Here.....

class NotificationTab extends StatefulWidget {
  @override
  _NotificationTabState createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 14,
                    offset: Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "4:04 PM",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    "VRM Event in 15 minutes",
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  ),
                  Text(
                    "Some Other Details",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//NotificationTab tab Ends Here.....
class Tabs {
  final IconData icon;
  final String title;
  final Color color;

  Tabs(this.icon, this.title, this.color);
}
