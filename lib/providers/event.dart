import 'package:delve_app/models/event.dart';
import 'package:flutter/foundation.dart';

class EventContext extends ChangeNotifier{
  Event _event;
  Event get event => _event;
  void setEvent(Event event){
    _event = event;
    notifyListeners();
  }
}