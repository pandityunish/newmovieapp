import 'package:flutter/cupertino.dart';
import 'package:movieapp/model/user_model.dart';

class UserProvider with ChangeNotifier {
  User _user = User(name: "", email: "", password: "");
  User get getuser => _user;
  void setuser(String user1) {
    _user = User.fromJson(user1);
    notifyListeners();
  }
}
