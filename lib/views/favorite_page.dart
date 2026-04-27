import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    final favMovies = provider.movies
        .where((m) => provider.favoriteIds.contains(m.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Movies")),
      body: favMovies.isEmpty
          ? Center(child: Text("No favorite movies yet 😢"))
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: favMovies.length,
              itemBuilder: (_, i) =>
                  MovieCard(favMovies[i]),
            ),
    );
  }
}