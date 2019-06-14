// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => new List<Movie>.from(json.decode(str).map((x) => Movie.fromMap(x)));

String movieToJson(List<Movie> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toMap())));

class Movie {
    String title;
    String image;
    double rating;
    int releaseYear;
    List<String> genre;

    Movie({
        this.title,
        this.image,
        this.rating,
        this.releaseYear,
        this.genre,
    });

    factory Movie.fromMap(Map<String, dynamic> json) => new Movie(
        title: json["title"],
        image: json["image"],
        rating: json["rating"].toDouble(),
        releaseYear: json["releaseYear"],
        genre: new List<String>.from(json["genre"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "image": image,
        "rating": rating,
        "releaseYear": releaseYear,
        "genre": new List<dynamic>.from(genre.map((x) => x)),
    };
}
