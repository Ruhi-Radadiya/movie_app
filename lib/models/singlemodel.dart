class Singlemovie {
  String title;
  String year;
  String released;
  String genre;
  String director;
  String writer;
  String actors;
  String language;
  String country;
  String awards;
  String poster;

  Singlemovie({
    required this.title,
    required this.year,
    required this.released,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
  });

  factory Singlemovie.fromJson(Map<String, dynamic> json) => Singlemovie(
        title: json["Title"],
        year: json["Year"],
        released: json["Released"],
        genre: json["Genre"],
        director: json["Director"],
        writer: json["Writer"],
        actors: json["Actors"],
        language: json["Language"],
        country: json["Country"],
        awards: json["Awards"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Released": released,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Language": language,
        "Country": country,
        "Awards": awards,
        "Poster": poster,
      };
}
