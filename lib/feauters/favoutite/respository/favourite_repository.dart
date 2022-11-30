import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/global.dart';
import 'package:movieapp/model/movie.dart';
import 'package:http/http.dart' as http;

class FavouriteRepository with ChangeNotifier {
  Future<List<Movie>> getallfavouriteitems(BuildContext context) async {
    List<Movie> allfavouriteitems = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/getallfavourite"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      handlinghttprequest(
          res: res,
          callback: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              allfavouriteitems
                  .add(Movie.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          },
          context: context);
    } catch (e) {
      showsnackbar(e.toString(), context);
    }
    return allfavouriteitems;
  }

  void addfavouriteitems(
      {required BuildContext context,
      required String name,
      required String image,
      required String desc,
      required String link}) async {
    try {
      Movie movie = Movie(name: name, image: image, desc: desc, link: link);
      http.Response res = await http.post(
        Uri.parse("$uri/addfavourite"),
        body: movie.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      handlinghttprequest(
          res: res,
          callback: () {
            showsnackbar("Movie added to favourite", context);
          },
          context: context);
    } catch (e) {
      showsnackbar(e.toString(), context);
    }
  }

  void deleteitems(
      {required BuildContext context, required String name}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$uri/deletefavouriteitem"),
        body: jsonEncode({"name": name}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      handlinghttprequest(
          res: res,
          callback: () {
            showsnackbar("Movie remove from favourite", context);
          },
          context: context);
    } catch (e) {
      showsnackbar(e.toString(), context);
      print(e.toString());
    }
  }
}
