import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/common/bottom_navigationbar.dart';
import 'package:movieapp/feauters/login/screens.dart/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? email;
  void getsetvalue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");
    setState(() {});
  }

  @override
  void initState() {
    getsetvalue();
    Timer(
      const Duration(seconds: 5),
      () {
        if (email == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, Bottomnavigationbar.routeName, (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome To MovieApp",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
      ),
    );
  }
}
