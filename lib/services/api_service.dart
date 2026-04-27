import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  final String apiKey = "9be3a171ff7e303e093ae454aa4e5687";

  Future<List<Movie>> fetchMovies() async {
    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}