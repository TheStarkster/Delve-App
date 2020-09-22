import 'package:delve_app/models/event.dart';
import 'package:flutter/foundation.dart';

class EventContext extends ChangeNotifier{
  Event _event;
  Event get event => _event;
  void setEvent(Event event){
    _event = event;
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