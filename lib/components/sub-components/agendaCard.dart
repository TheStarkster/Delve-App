import 'package:flutter/material.dart';

class AgendaCard extends StatelessWidget {
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
                    "VRM Unplugged",
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
                Text(
                  "Dress Code: Fusion Wear/ Indo-Western Outfit",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway-Medium',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Divider(
                  height: 24,
                ),
                Text(
                  "11:30 am - 12:00 pm EST",
                  style: TextStyle(
                    color: Colors.black,
                    // fontFamily: 'Raleway-Medium',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18, top: 4),
                  child: Text(
                    "(IST - 10:30 hrs)",
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
