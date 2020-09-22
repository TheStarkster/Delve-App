import 'dart:convert';
import 'dart:io';
import 'package:delve_app/utils/repository/api/constants.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class ApiHandlers {
  ApiConstants get apiconstants => GetIt.I<ApiConstants>();
  Future checkIfNumberExists(String eventId, String phone) async {
    File file = await DefaultCacheManager()
        .getSingleFile(apiconstants.version1.getAttendee(eventId, phone));
    var value = await file.readAsString();
    var json = jsonDecode(value);
    if (json.isEmpty) {
      return 0;
    } else {
      return json;
    }
  }
  Future getEvent(String eventCode) async {
    File file = await DefaultCacheManager()
        .getSingleFile(apiconstants.version1.getEvent(eventCode));
    var value = await file.readAsString();
    var json = jsonDecode(value);
      if (json.isEmpty) {
        return 0;
      } else {
        return json;
      }
  }
  Future saveFcmToken(String token, String id) async {
    await get(apiconstants.version1.saveFcmToken(id),headers: {"token":token});
  }

  Future getGallery(String eventId) async {
    Response res = await get(apiconstants.version1.getGallery(eventId));
    return jsonDecode(res.body);
  }
}
