import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> movies = [];
  List<int> favoriteIds = [];

  bool isLoading = false;
  String? error;

  // FETCH MOVIES + CACHE
  Future<void> fetchMovies() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      print("FETCH FROM API");

      movies = await ApiService().fetchMovies();

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
        "movies",
        jsonEncode(movies.map((e) => e.toJson()).toList()),
      );
    } catch (e) {
      print("LOAD FROM CACHE");

      error = "No Internet 😢";

      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString("movies");

      if (cached != null) {
        movies = (jsonDecode(cached) as List)
            .map((e) => Movie.fromJson(e))
            .toList();
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // SEARCH
  Future<List<Movie>> searchMoviesAsync(String query) async {
  await Future.delayed(Duration(milliseconds: 300)); // simulasi async

  return movies
      .where((m) =>
          m.title.toLowerCase().contains(query.toLowerCase()))
      .toList();
}

  // LOAD FAVORITES
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    favoriteIds = prefs.getStringList("favorites") == null
        ? []
        : prefs.getStringList("favorites")!
            .map((e) => int.parse(e))
            .toList();

    notifyListeners();
  }

  // TOGGLE FAVORITE
  Future<void> toggleFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();

    if (favoriteIds.contains(movieId)) {
      favoriteIds.remove(movieId);
    } else {
      favoriteIds.add(movieId);
    }

    prefs.setStringList(
      "favorites",
      favoriteIds.map((e) => e.toString()).toList(),
    );

    notifyListeners();
  }

  // CHECK FAVORITE
  bool isFavorite(int id) {
    return favoriteIds.contains(id);
  }
}