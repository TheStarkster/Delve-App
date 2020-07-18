import 'package:flutter/material.dart';

class AgendaCard extends StatelessWidget {
  final String agendaName,remarks,from,to,venue;
  AgendaCard({this.agendaName,this.remarks,this.from,this.to,this.venue});

  String calculateDiff(String s1,String s2){
    int time1 = int.parse(int.parse(s1.split(":")[0]) > 12 ? (int.parse(s1.split(":")[0]) - 12).toString() +  s1.split(":")[1] : s1.split(":")[0] +  s1.split(":")[1]);
    int time2 = int.parse(int.parse(s2.split(":")[0]) > 12 ? (int.parse(s2.split(":")[0]) - 12).toString(): s2.split(":")[0] + s2.split(":")[1]);
    double hourDiff = time2 / 100 - time1 / 100 - 1;
    int minDiff = time2 % 100 + (60 - time1 % 100); 
    if (minDiff >= 60) { 
        hourDiff++; 
        minDiff = minDiff - 60; 
    }
    String res = hourDiff.abs().toStringAsFixed(0) + " hour " + minDiff.abs().toStringAsFixed(0) + " minute Agenda";
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 38, left: 16, right: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    agendaName,
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Raleway-Medium',
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                    ),
                  ),
                ),
                Padding(
                  child: Container(
                    height: 4,
                    width: 90,
                    color: Colors.purpleAccent,
                  ),
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Remarks"),
                      padding: EdgeInsets.only(top:6,bottom:6,right:18,left:18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Flexible(
                      child: Text(
                      remarks,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway-Medium',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    )
                  ],
                ),
                SizedBox(height: 18,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Venue"),
                      padding: EdgeInsets.only(top:6,bottom:6,right:18,left:18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Flexible(
                      child: Text(
                      venue,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway-Medium',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    )
                  ],
                ),
                Divider(
                  height: 24,
                ),
                Text(
                  from.split(":")[0] + ":" + from.split(":")[1] + " - " + to.split(":")[0] + ":" + to.split(":")[1],
                  style: TextStyle(
                    color: Colors.black,
                    // fontFamily: 'Raleway-Medium',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18, top: 4),
                  child: Text(
                    calculateDiff(from, to),
                    style: TextStyle(
                      color: Colors.black45,
                      // fontFamily: 'Raleway-Medium',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              bottom: 3,
              right: 10,
            ),
          ],
        ),
      ),
    );
  }
}
