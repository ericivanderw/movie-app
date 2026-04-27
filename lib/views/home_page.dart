import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/custom_error_widget.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = "";

  @override
  void initState() {
    super.initState();

    final provider =
        Provider.of<MovieProvider>(context, listen: false);

    provider.fetchMovies();
    provider.loadFavorites();
  }

  Widget buildGrid(List movies) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (_, i) => MovieCard(movies[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("🎬 Movies"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritePage(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // search
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search movies...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
          ),

          Expanded(
            child: query.isEmpty
                ? (provider.isLoading
                    ? LoadingShimmer()
                    : provider.error != null &&
                            provider.movies.isEmpty
                        ? CustomErrorWidget(provider.error!)
                        : buildGrid(provider.movies))
                : FutureBuilder(
                    future: provider.searchMoviesAsync(query),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return LoadingShimmer();
                      } else if (snapshot.hasData) {
                        return buildGrid(snapshot.data!);
                      } else {
                        return Center(
                          child: Text("No results 🎬"),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}