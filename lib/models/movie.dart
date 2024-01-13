// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final String? title;
  final String? release_date;
  final String? over_view;
  final String? poster_url;

  Movie({
    this.title,
    this.release_date,
    this.over_view,
    this.poster_url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'release_date': release_date,
      'over_view': over_view,
      'poster_url': poster_url,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title:
          map['title'] != null ? map['title'] as String : map['name'] as String,
      release_date: map['release_date'] as String,
      over_view: map['over_view'] as String,
      poster_url: map['poster_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
