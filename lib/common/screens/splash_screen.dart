import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/screens/bottom_navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style:const TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold,),
         child: AnimatedTextKit(
          onFinished: () {
          Navigator.pushNamedAndRemoveUntil(
              context, Bottomnavigationbar.routeName, (route) => false);
          },
          
          repeatForever: false,
          isRepeatingAnimation: false,
          animatedTexts: [
          TyperAnimatedText("Welcome To Movie app" ,
          textAlign: TextAlign.center,
          textStyle: TextStyle(color: Colors.white),
          speed:const Duration(milliseconds: 100))
         ])),
      ),
    );
  }
}
