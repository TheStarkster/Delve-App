class Constants {
  static String get baseURL => "http://2b3068fe0609.ngrok.io/";
}
class Version1 {
  String getEvent(String id) => Constants.baseURL + "v1/events/read/" + id;
  String getAttendee(String id,String phone) => Constants.baseURL + "v1/events/read-attendie/" + phone + "/" + id;
  String saveFcmToken(String id) => Constants.baseURL + "v1/events/save-attendee-token/" + id;
}
class ApiConstants {
  Version1 get version1 => Version1();
}