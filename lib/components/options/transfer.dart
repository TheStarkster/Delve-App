import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:intent/action.dart' as IntentActions;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intent/intent.dart' as IntentService;
class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  UserContext userContext;
  EventContext eventContext;
  List<DateTime> transfersDates;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
    transfersDates = eventContext.event.transfers
        .map((a) => DateTime.parse(a["transferDate"]))
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
                  "Transfer",
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
      body: DefaultTabController(
        length: transfersDates.length,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 70),
              child: TabBar(
                  indicatorWeight: 6,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
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
                  tabs: List.generate(transfersDates.length, (index){
                    return Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              transfersDates[index].day.toString(),
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontFamily: 'Raleway-Medium',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                getDay(transfersDates[index].weekday),
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
                  children: List.generate(transfersDates.length, (index) {
                    List<Map<String,dynamic>> transfers = eventContext.event.transfers.where((e) => DateTime.parse(e["transferDate"]) == transfersDates[index]).map<Map<String,dynamic>>((e) => e).toList();
                    return Container(
                    padding: EdgeInsets.only(top:24),
                    child: ListView(
                      children: List.generate(transfers.length, (index2){
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: 18, left: 12, right: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transfers[index2]["name"],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Raleway-Medium',
                                    fontSize: 21,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "From " + transfers[index2]["origin"],
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Raleway-Medium',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  child: Container(
                                    width: 80,
                                    height: 4,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                                Text(
                                  transfers[index2]["vehicleNumber"] != null ? transfers[index2]["mode"] + " - " + transfers[index2]["vehicleNumber"] : transfers[index2]["mode"],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Raleway-Regular',
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3, bottom: 8),
                                  child: Text(
                                    transfers[index2]["driverName"],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway-Regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      transfers[index2]["driverPhone"],
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => IntentService.Intent()
                                      ..setAction(IntentActions.Action.ACTION_DIAL)
                                      ..setData(Uri(scheme: 'tel', path: transfers[index2]["driverPhone"]))
                                      ..startActivity().catchError((e) => print(e)),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 24),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 14,
                                              right: 14),
                                          child: Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Raleway-Regular'),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.black12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 21,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DateFormat.jm().format(DateTime.parse(transfers[index2]["transferDate"])),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Journey Time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        transfers[index2]["journeyTime"].toString() + " Hour(s)",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Distance",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                       transfers[index2]["distance"].toString() + " Km(s)",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
