import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = "http://192.168.100.2:3000";
void showsnackbar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

void handlinghttprequest(
    {required http.Response res,
    required VoidCallback callback,
    required BuildContext context}) async {
  switch (res.statusCode) {
    case 200:
      callback();
      break;
    case 400:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonDecode(res.body)["mes"])));
      break;
    case 500:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonDecode(res.body)["mes"])));
      break;
    default:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonDecode(res.body))));
  }
}
