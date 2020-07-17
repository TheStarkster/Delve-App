
class Event {
  int _id;
  int _name;
  DateTime _liveFrom;
  DateTime _liveTo;
  int _customerId;
  String _plackCardImage;
  String _eventImage;
  List<Map<String, dynamic>> _agendas;
  List<Map<String, dynamic>> _transfers;
  List<Map<String, dynamic>> _eventRepresentatives;
  Map<String, dynamic> _location;

  int get id => _id;
  int get name => _name;
  DateTime get liveFrom => _liveFrom;
  DateTime get liveTo => _liveTo;
  int get customerId => _customerId;
  String get plackCardImage => _plackCardImage;
  String get eventImage => _eventImage;
  List get agendas => _agendas;
  List get transfers => _transfers;
  List get eventRepresentatives => _eventRepresentatives;
  Map get location => _location;

  Event.fromJSON(Map<String, dynamic> json){
    _id = json["id"];
    _name = json["name"];
    _liveFrom = DateTime(json["liveFrom"]);
    _liveTo = DateTime(json["liveTo"]);
    _plackCardImage = json["plackCardImage"];
    _eventImage = json["eventImage"];
    _agendas = json["Agendas"];
    _transfers = json["Transfers"];
    _eventRepresentatives = json["Representatives_for_Events"];
    _location = json["Locations"];
  }
}
