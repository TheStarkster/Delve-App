import 'package:delve_app/models/event.dart';
import 'package:delve_app/models/query.dart';
import 'package:flutter/foundation.dart';

class EventContext extends ChangeNotifier{
  Event _event;
  List<Query> _queries;

  Event get event => _event;
  List<Query> get queries => _queries;

  void setEvent(Event event){
    _event = event;
    notifyListeners();
  }

  void setQueries(List<Query> list){
    _queries = list;
    notifyListeners();
  }

  void addQuery(Query query){
    _queries.add(query);
    notifyListeners();
  }

  void setGalleryImages(List<dynamic> gallery){
    _event.setEventGalleryImages(gallery);
    notifyListeners();
  }

  void setSingleGalleryImage(Map<String, dynamic> image){
    _event.setSingleGalleryImage(image);
    notifyListeners();
  }
}