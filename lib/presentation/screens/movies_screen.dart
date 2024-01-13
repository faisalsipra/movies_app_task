import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/constants/contants.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/presentation/screens/favorites_screen.dart';
import 'package:movies_app/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/services/movieService.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Movies'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(FavoritesScreen());
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<Movie>>(
            future: MovieService.fetchMovies(),
            builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const CircularProgressIndicator());
              }

              final moviesList = snapshot.data;

              return Expanded(
                child: GridView.builder(
                  itemCount: moviesList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 275,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(MovieDetailScreen(
                            currentMovie: moviesList[index],
                          ));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(21)),
                              child: Image.network(
                                '${Constants.imageBaseUrl}${moviesList[index].poster_url}',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
