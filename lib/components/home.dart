import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:delve_app/components/options/aboutCity.dart';
import 'package:delve_app/components/options/agendas.dart';
import 'package:delve_app/components/options/contacts.dart';
import 'package:delve_app/components/options/queries.dart';
import 'package:delve_app/components/options/tickets&profile.dart';
import 'package:delve_app/components/options/transfer.dart';
import 'package:delve_app/components/sub-components/agendaCard.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  TabController tabBarController;
  List<Tabs> tabs = new List();
  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabs.add(Tabs(Icons.home, "Home", Colors.orange));
    tabs.add(Tabs(Icons.history, "Recent", Colors.pink));
    tabs.add(
        Tabs(Icons.notifications_active, "Notification", Colors.blueAccent));
    tabBarController =
        new TabController(initialIndex: currentPage, length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  "Vinit Sonker",
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
    );
  }
}

//Home tab Starts Here.....
class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                  "All Events",
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
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/eventImage.jpg'),
                                fit: BoxFit.fill),
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
                  "Hotel Holiday Inn, Andheri East, Mumbai",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontFamily: 'Raleway-Medium',
                  ),
                ),
                Container(
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
                )
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Recents",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontFamily: 'Raleway-Regular',
              ),
            ),
          ),
          AgendaCard(),
        ],
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
