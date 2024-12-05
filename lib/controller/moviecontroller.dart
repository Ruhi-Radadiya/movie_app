import 'package:flutter/material.dart';
import 'package:movie_app/helper/moviehelper.dart';

import '../models/moviemodel.dart';

class Moviecontroller extends ChangeNotifier {
  String movie = "hollywood";

  Future<List<Search>> getMovie() async {
    return await Moviehelper.moviehelper.getMoviedata(movie: movie) ?? [];
  }

  void getData({required String movie}) {
    this.movie = movie;
    notifyListeners();
  }
}
