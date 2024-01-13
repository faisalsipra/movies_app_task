import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/constants/hive/hive.dart';
import 'package:movies_app/controller/common_controller.dart';

import '../../constants/contants.dart';
import '../../models/movie.dart';
import 'movie_detail_screen.dart';


class FavoritesScreen extends GetView<CommonController> {
  // FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Movies'),
        ),
        body: Obx(
          () => Column(
            children: [
              if (controller.favoritesMovies.isNotEmpty) ...{
                Expanded(
                    child: GridView.builder(
                  itemCount: controller.favoritesMovies.length,
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
                            currentMovie: controller.favoritesMovies[index],
                          ));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(21)),
                              child: Image.network(
                                '${Constants.imageBaseUrl}${controller.favoritesMovies[index].poster_url}',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ))
              } else ...{
                SizedBox(
                  height: Get.height * 0.7,
                  child: const Center(
                    child: Text('No Favorite Movies yet!'),
                  ),
                ),
              }
            ],
          ),
        ));
  }
}
