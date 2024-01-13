import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/models/movie.dart';

import '../constants/hive/hive.dart';

class CommonController extends GetxController {
  List<Movie> favoritesMovies = <Movie>[].obs;
  List<Movie> allMovies = <Movie>[].obs;

  Future<void> fetchAllFavoriteMovies() async {
    final box = await Hive.openBox(HiveConstants.moviesBox);
    final indexBox = await Hive.openBox('indexBox');
    final index = await indexBox.get('index');

    print('index:' +index.toString());
    List<Movie> newFavorites = [];

    for (var i = 0; i < index; i++) {


      final data = await box.get(i+1);
      print('data:' + data.toString());
      final Map<String, dynamic> map = jsonDecode(data);

      newFavorites.add(Movie(
        title: map['title'],
        over_view: map['over_view'],
        poster_url: map['poster_url'],
        release_date: map['release_date'],
      ));
    }

    // Clear the existing list and add the new items
//    favoritesMovies.clear();
    favoritesMovies.addAll(newFavorites);
  }

  @override
  void onInit() {
    fetchAllFavoriteMovies();
    super.onInit();
  }
}
