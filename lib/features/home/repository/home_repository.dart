import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/constant/api_routes.dart';
import 'package:movieapp/common/constant/global.dart';
import 'package:movieapp/model/movie.dart';
import 'package:http/http.dart' as http;

class Homerepository with ChangeNotifier {
  Future <Movie> getallmovie({required BuildContext context}) async {
    Movie? movies;
    try {
      http.Response res = await http.get(
        Uri.parse(allmovies),
        headers: <String, String>{
           'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDc5NmNjNmM4NzFlYTBkMGE4ODExN2EwZTRhNzdiMyIsInN1YiI6IjYyN2M3YzMxOTY3Y2M3MDA5ZGQwNzVjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eq1y7VS28ATW0ZQLeH5eIDo6E5Xxm-BLCN-QL8de4aE',
          'Content-Type': 'application/json',
        },
      );
     
      handlinghttprequest(
          res: res,
          callback: () {
            print(res.body);
          movies=movieFromJson(res.body);
          },
          context: context);
    } catch (e) {
      showsnackbar(e.toString(), context);
    }
    return movies!;
  }
}
