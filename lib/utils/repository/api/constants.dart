class Constants {
  static String get baseURL => "http://10.0.2.2:5000/";
}
class Version1 {
  String getEvent(String id) => Constants.baseURL + "v1/events/read/" + id;
  String getAttendee(String id,String phone) => Constants.baseURL + "v1/events/read-attendie/" + phone + "/" + id;
  String saveFcmToken(String id) => Constants.baseURL + "v1/events/save-attendee-token/" + id;
  String get saveIdProof => Constants.baseURL + "v1/events/save-attendee-IdProof";
  String getGallery(String eventId) => Constants.baseURL + "v1/events/get-gallery/" + eventId;
  String get saveImageToGallery => Constants.baseURL + "v1/events/upload-image";
  String get getCompanyDescription => Constants.baseURL + "v1/about-company/get-description";
  String get getCompanyGallery => Constants.baseURL + "v1/about-company/get-all-images";
}
class ApiConstants {
  Version1 get version1 => Version1();
}