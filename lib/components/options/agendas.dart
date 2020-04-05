import 'package:delve_app/components/sub-components/agendaCard.dart';
import 'package:flutter/material.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: 'eventHero',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 12,
                        offset: Offset(0, 12),
                      ),
                    ],
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/eventImage.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 24),
                child: Scaffold(
                  body: DefaultTabController(
                    length: 4,
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
                              tabs: [
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints:
                                        BoxConstraints.expand(width: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    constraints:
                                        BoxConstraints.expand(width: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    constraints:
                                        BoxConstraints.expand(width: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    constraints:
                                        BoxConstraints.expand(width: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              Day(),
                              Container(
                                child: Text("Articles Body"),
                              ),
                              Container(
                                child: Text("User Body"),
                              ),
                              Container(
                                child: Text("User Body"),
                              ),
                            ]),
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

class Day extends StatefulWidget {
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 24,
              top: 18,
              left: 16,
            ),
            child: Text(
              "Agendas",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21,
                fontFamily: 'Raleway-Medium',
              ),
            ),
          ),
          AgendaCard(),
          AgendaCard(),
          AgendaCard(),
        ],
      ),
    );
  }
}
