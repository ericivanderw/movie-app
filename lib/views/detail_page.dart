import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';
import '../providers/movie_provider.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: [
          IconButton(
            icon: Icon(
              p.isFavorite(movie.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () => p.toggleFavorite(movie.id),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔥 FINAL FIX POSTER
            Container(
              width: double.infinity,
              color: Colors.black,
              child: Stack(
                children: [
                  Image.network(
                    movie.poster,
                    width: double.infinity,
                    fit: BoxFit.contain, // tidak kepotong
                  ),

                  // gradient bawah saja
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(movie.overview,
                      style: TextStyle(color: Colors.grey[300])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}