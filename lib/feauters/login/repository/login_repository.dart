import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/global.dart';
import 'package:movieapp/feauters/home/screens/homepage.dart';
import 'package:movieapp/model/user_model.dart';
import "package:http/http.dart " as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepsitory with ChangeNotifier {
  void setdata(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", email);
  }

  void siginuser(
      {required String email,
      required BuildContext context,
      required String name,
      required String password}) async {
    User user = User(name: name, email: email, password: password);
    http.Response res = await http.post(
      Uri.parse(
        "$uri/api/sigin",
      ),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    handlinghttprequest(
        res: res,
        callback: () {
          showsnackbar("Account created Successfully", context);
          setdata(email);
          Navigator.pushNamed(context, Hompage.routeName);
          getuserdata(context: context, email: email);
        },
        context: context);
  }

  void loginuser(
      {required String password,
      required String email,
      required BuildContext context}) async {
    http.Response res = await http.post(
      Uri.parse("$uri/api/sigup"),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    handlinghttprequest(
        res: res,
        callback: () {
          setdata(email);
          Navigator.pushNamed(context, Hompage.routeName);
        },
        context: context);
  }

  Future<User> getuserdata(
      {required BuildContext context, required String email}) async {
    User user = User(name: "", email: "", password: "");
    try {
      http.Response userRes = await http.post(
        Uri.parse("$uri/"),
        body: jsonEncode({"email": email}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      user = User.fromJson(userRes.body);
    } catch (e) {
      showsnackbar(e.toString(), context);
    }
    return user;
  }
}
