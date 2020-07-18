class User {
  int _id;
  String _name;
  String _phone;
  String _email;
  String _location;
  int _eventId;
  String _aticket;
  String _dticket;
  String _aTicketFrom;
  String _aTicketTo;
  String _dTicketFrom;
  String _dTicketTo;

  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;
  String get location => _location;
  int get eventId => _eventId;
  String get aticket => _aticket;
  String get dticket => _dticket;
  String get aTicketFrom => _aTicketFrom;
  String get aTicketTo => _aTicketTo;
  String get dTicketFrom => _dTicketFrom;
  String get dTicketTo => _dTicketTo;

  User.fromJSON(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
    _phone = json["phone"];
    _email = json["email"];
    _location = json["location"];
    _eventId = json["EventId"];
    _aticket = json["aticket"];
    _dticket = json["dticket"];
    _aTicketFrom = json["aTicketFrom"];
    _aTicketTo = json["aTicketTo"];
    _dTicketFrom = json["dTicketFrom"];
    _dTicketTo = json["dTicketTo"];
  }
}
