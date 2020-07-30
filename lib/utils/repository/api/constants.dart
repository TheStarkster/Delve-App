class Constants {
  static String get baseURL => "http://f70457bf1879.ngrok.io/";
}
class Version1 {
  String getEvent(String id) => Constants.baseURL + "v1/events/read/" + id;
  String getAttendee(String id,String phone) => Constants.baseURL + "v1/events/read-attendie/" + phone + "/" + id;
  String saveFcmToken(String id) => Constants.baseURL + "v1/events/save-attendee-token/" + id;
  String get saveIdProof => Constants.baseURL + "v1/events/save-attendee-IdProof";
}
class ApiConstants {
  Version1 get version1 => Version1();
}