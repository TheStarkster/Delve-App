import 'package:delve_app/models/user.dart';
import 'package:flutter/foundation.dart';

class UserContext extends ChangeNotifier{
  User _user;
  User get user => _user;
  void setUser(User user){
    _user = user;
    notifyListeners();
  }
}