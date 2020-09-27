import 'package:delve_app/models/company.dart';
import 'package:flutter/foundation.dart';

class CompanyContext extends ChangeNotifier{
  Company _company = new Company();
  Company get company => _company;

  void setDescription(String description){
    _company.setDescription(description);
    notifyListeners();
  }

  void setGallery(List<dynamic> gallery){
    _company.setGallery(gallery);
    notifyListeners();
  }
}