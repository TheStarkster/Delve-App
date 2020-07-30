import 'dart:io';
import 'package:delve_app/providers/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ShowContent extends StatefulWidget {
  @override
  _ShowContentState createState() => _ShowContentState();
}

class _ShowContentState extends State<ShowContent> {
  dynamic html;
  File file;
  EventContext eventContext;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    eventContext = Provider.of<EventContext>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: eventContext.event.desc,
      ),
    );
  }
}
