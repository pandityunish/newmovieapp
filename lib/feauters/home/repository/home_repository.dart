import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/global.dart';
import 'package:movieapp/model/movie.dart';
import 'package:http/http.dart' as http;

class Homerepository with ChangeNotifier {
  Future<List<Movie>> getallmovie({required BuildContext context}) async {
    List<Movie> movies = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/upcommingMovies"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      handlinghttprequest(
          res: res,
          callback: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              movies.add(Movie.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          },
          context: context);
    } catch (e) {
      showsnackbar(e.toString(), context);
    }
    return movies;
  }
}
