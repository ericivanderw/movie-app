class Movie {
  final int id;
  final String title;
  final String poster;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] ?? 0, // 🔥 anti null
    title: json['title'] ?? "No Title",

    // 🔥 handle API & cache
    poster: json['poster'] ??
        (json['poster_path'] != null
            ? "https://image.tmdb.org/t/p/w500${json['poster_path']}"
            : ""),

    overview: json['overview'] ?? "",
  );
}

    Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'poster': poster, // 🔥 FIX
    'overview': overview,
  };
}
}