class Constants {
  static String get baseURL => "http://0f9b4cd6730c.ngrok.io/";
}
class Version1 {
  String getEvent(String id) => Constants.baseURL + "v1/events/read/" + id;
  String getAttendee(String id,String phone) => Constants.baseURL + "v1/events/read-attendie/" + phone + "/" + id;
}
class ApiConstants {
  Version1 get version1 => Version1();
}