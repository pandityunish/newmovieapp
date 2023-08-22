
import 'package:flutter/cupertino.dart';
import 'package:movieapp/model/movie.dart';

class FavouriteRepository with ChangeNotifier {
  List<Result> movie=[];
  List<Result> get favoritemovie=>movie;
  void addtofavorite(Result result){
    favoritemovie.add(result);
    notifyListeners();
  }
  void removefavorite(Result result){
    favoritemovie.remove(result);
    notifyListeners();
  }
}
