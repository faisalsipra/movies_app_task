import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/constants/contants.dart';
import 'package:movies_app/constants/hive/hive.dart';

import '../../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.currentMovie,
  });

  final Movie currentMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(13),
                bottomRight: Radius.circular(13)),
            child: Container(
              width: Get.width,
              height: Get.height * 0.50,
              child: Image.network(
                '${Constants.imageBaseUrl}${currentMovie.poster_url}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            currentMovie.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 11),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Text(
                currentMovie.over_view!,
                style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    // fontSize: 20,
                    ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: Get.width * 0.9,
            height: 45,
            child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  Get.closeAllSnackbars();
                  Get.snackbar(
                    '${currentMovie.title}',
                    'added to favorites',
                    snackPosition: SnackPosition
                        .TOP, // Optional, default is SnackPosition.TOP
                    duration: const Duration(
                        seconds: 3), // Optional, default is 3 seconds
                    backgroundColor:
                        Colors.black, // Optional, change background color
                    colorText: Colors.white, // Optional, change text color
                  );

                  final box = await Hive.openBox(HiveConstants.moviesBox);
                  // List<Movie> moviesList = [];
                  // moviesList.add(currentMovie);
                  // await box.put('moviesList', jsonEncode(moviesList));

// Check if the movie is already in the box
                  final result = box.values.toList();
                  for (int i = 0; i < result.length; i++) {
                    final decode = jsonDecode(result[i]);
                    print('decode:' + decode.toString());

                  }
                  // final isMovieAdded = box.values.any((movie) {
                  //   final decode = jsonDecode(movie);
                  //        print('decode:' + decode.toString());
                  //   return (Movie(
                  //         over_view: decode['over_view'],
                  //         poster_url: decode['poster_url'],
                  //         release_date: decode['release_date'],
                  //         title: decode['title'],
                  //       ) ==
                  //       Movie(
                  //
                  //         over_view: currentMovie.over_view,
                  //         poster_url: currentMovie.poster_url,
                  //         release_date: currentMovie.release_date,
                  //         title: currentMovie.title,
                  //       ));
                  // });

                  //  print(isMovieAdded.toString());
                  final index = await box.add(currentMovie.toJson());
                  final indexBox = await Hive.openBox('indexBox');
                  await indexBox.put('index', index);
                },
                child: const Text('Add to favorites')),
          ),
          const SizedBox(
            height: 11,
          ),
        ],
      ),
    );
  }
}
