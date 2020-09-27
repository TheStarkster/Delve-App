import 'package:delve_app/main.dart';
import 'package:delve_app/models/query.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:delve_app/utils/repository/api/handlers.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

class Querie extends StatefulWidget {
  @override
  _QuerieState createState() => _QuerieState();
}

class _QuerieState extends State<Querie> {
  UserContext userContext;
  EventContext eventContext;
  ApiHandlers apiHandlers = new ApiHandlers();
  TextEditingController textEditingController = new TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);

    if (eventContext.queries == null) {
      apiHandlers.getQueries(prefs.getString("EventId")).then((value) {
        List<Query> list = [];
        for (var query in value) {
          list.add(Query.fromJson(query));
        }
        eventContext.setQueries(list);
      });
    }
  }

  void refreshQueries() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Row(
          children: [
            Padding(
              child: CircularProgressIndicator(),
              padding: EdgeInsets.only(right: 14),
            ),
            Text(
              "Refreshing...",
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
    apiHandlers.getQueries(prefs.getString("EventId")).then((value) {
      List<Query> list = [];
      for (var query in value) {
        list.add(Query.fromJson(query));
      }
      eventContext.setQueries(list);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void askQuery(String question) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Row(
          children: [
            Padding(
              child: CircularProgressIndicator(),
              padding: EdgeInsets.only(right: 14),
            ),
            Text(
              "Submiting...",
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
    apiHandlers.createQuery(prefs.getString("EventId"), userContext.user.id.toString(), question)
    .then((value) {
      if(value){
        eventContext.addQuery(Query.fromJson({
          "eventId": int.parse(prefs.getString("EventId")),
          "AttendeeId": userContext.user.id,
          "question": question,
          "solved": false
        }));
        Navigator.pop(context);
        textEditingController.text = "";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: refreshQueries,
          ),
        ],
          centerTitle: true,
          title: Text(
            "Queries",
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Raleway-Regular',
              color: Colors.black,
            ),
          )
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              "Submit You Query, We will Try To Contact Or Answer you Query as Soon as Possible",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway-Light',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8, right: 18, left: 18),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.only(left: 12),
                hintText: "Ask Here",
                hintStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontFamily: 'Raleway-Light',
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(18),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    height: 45,
                    onPressed: () => askQuery(textEditingController.text),
                    shape: StadiumBorder(),
                    color: Color(0xFF2E375C),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Raleway-Light',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, left: 21, right: 21, bottom: 18),
            child: Text(
              "Recent Queries",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Raleway-Medium',
              ),
            ),
          ),
          eventContext.queries == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                )
              : eventContext.queries == []
                  ? Column(
                      children: [
                        Text(
                          "No Queries Yet",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontFamily: 'Raleway-Medium',
                          ),
                        ),
                      ],
                    )
                  : Column(
            children: List.generate(
              eventContext.queries.length,
                  (index) => Padding(
                padding: EdgeInsets.only(top: 8, left: 21, right: 21),
                child: ExpansionTile(
                  title: Text(
                    eventContext.queries[index].question,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Raleway-Medium',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            eventContext.queries[index].answer??"Not Resolved Yet",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Raleway-Light',
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
