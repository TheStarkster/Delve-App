class Query {
  int _id;
  int _eventId;
  int _attendeeId;
  String _question;
  String _answer;
  bool _solved;

  int get id => _id;
  int get eventId => _eventId;
  int get attendeeId => _attendeeId;
  String get question => _question;
  String get answer => _answer;
  bool get solved => _solved;

  Query.fromJson(Map<String, dynamic> json){
    _id = json["id"];
    _eventId = json["eventId"];
    _attendeeId = json["AttendeeId"];
    _question = json["question"];
    _answer = json["answer"];
    _solved = json["solved"];
  }
}