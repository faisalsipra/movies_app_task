import 'dart:convert';

import 'package:movies_app/constants/contants.dart';

import '../models/movie.dart';
import '../models/movieList.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    List<Movie> movies = [];
    // final response = await http.get(Uri.parse(
    //     'https://api.themoviedb.org/3/list/8286888?api_key=cf494d66488e23e265b989210f731313'));

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/list/8286888?api_key=${Constants.apiKey}'));

    final decodedResponse = jsonDecode(response.body);
    //  print('decoded Response:' + decodedResponse.toString());

    final moviesListModel = MovieListModel.fromJson(decodedResponse);
    print('ok');
    print(moviesListModel);
    // return Movie.fromJson(decodedResponse);
    // print(moviesListModel.items?.length.toString());

    for (var movie in moviesListModel.items!) {
      movies.add(Movie(
        over_view: movie.overview,
        poster_url: movie.posterPath,
        release_date: movie.releaseDate,
        title: movie.name != null ? movie.name : movie.title,
      ));
    }
    print('movies length: ' + movies.length.toString());
    return movies;
  }
}
