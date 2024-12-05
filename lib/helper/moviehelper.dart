import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/moviemodel.dart';

import '../models/singlemodel.dart';

class Moviehelper {
  Moviehelper._();

  static Moviehelper moviehelper = Moviehelper._();

  Future<List<Search>?> getMoviedata({required String movie}) async {
    String apikey = "2e658b58";

    Uri url = Uri.parse(
      "https://omdbapi.com/?i=tt3896198&apikey=$apikey&s=$movie&type=movie",
    );
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      Moviemodel moviedata = Moviemodel.fromJson(json: data);

      return moviedata.search;
    }
    return null;
  }

  Future<Singlemovie?> getSingleMoviedata({required String movie}) async {
    String apikey = "2e658b58";

    Uri url = Uri.parse(
      "https://www.omdbapi.com/?t=$movie&apikey=$apikey&type=movie",
    );
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      Singlemovie singleMoviedata = Singlemovie.fromJson(data);

      return singleMoviedata;
    }
    return null;
  }
}
