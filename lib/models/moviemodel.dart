class Moviemodel {
  List<Search> search;

  Moviemodel({
    required this.search,
  });

  factory Moviemodel.fromJson({required Map<String, dynamic> json}) =>
      Moviemodel(
        search: List<Search>.from(
          json["Search"].map(
            (x) => Search.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
      };
}

class Search {
  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  Search({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
