import 'package:cached_network_image/cached_network_image.dart';
import 'package:delve_app/components/sub-components/agendaCard.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> with SingleTickerProviderStateMixin {
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
              flex: 1,
              child: Hero(
                tag: 'eventHero',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: CachedNetworkImage(
                    imageUrl: eventContext.event.eventImage,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
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
                                  false
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

class Day extends StatefulWidget {
  final bool onlyRenderExpired;
  final List<Map<String, dynamic>> agendas;
  Day(this.agendas,this.onlyRenderExpired);
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
          Column(children: List.generate(widget.agendas.length, (index) {
              var time = DateTime.utc(int.parse(widget.agendas[index]["startDate"].split("-")[0]),int.parse(widget.agendas[index]["startDate"].split("-")[1]),int.parse(widget.agendas[index]["startDate"].split("-")[2]),int.parse(widget.agendas[index]["startTime"].split(":")[0]),int.parse(widget.agendas[index]["startTime"].split(":")[1]),0);
              if(widget.onlyRenderExpired){
                return time.isBefore(DateTime.now()) ?
                AgendaCard(
                agendaName: widget.agendas[index]["name"],
                from: widget.agendas[index]["startTime"],
                to: widget.agendas[index]["endTime"],
                remarks: widget.agendas[index]["remarks"],
                venue: widget.agendas[index]["venue"],
                isLapsed: time.isBefore(DateTime.now()),
                isInExpired: true,
              )
              :
              Container();
              }
              return AgendaCard(
                agendaName: widget.agendas[index]["name"],
                from: widget.agendas[index]["startTime"],
                to: widget.agendas[index]["endTime"],
                remarks: widget.agendas[index]["remarks"],
                venue: widget.agendas[index]["venue"],
                isLapsed: time.isBefore(DateTime.now())
              );
            }),
          )
        ],
      ),
    );
  }
}
