import 'package:flutter/material.dart';
import 'package:flutterimdb/constants.dart';
import 'package:flutterimdb/screens/search_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterimdb/models/movie_detail.dart';
import 'package:flutterimdb/widgets/movie_card.dart';
import 'package:flutterimdb/widgets/movie_poster.dart';

const apiKey = '4f1289ea6b49ba164744ceec9a1c9035';
const movieURL = 'https://api.themoviedb.org/3/movie/top_rated';
const searchURL = 'https://api.themoviedb.org/3/search/movie';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final List<MovieDetail> items = [];
  @override
  void initState() {
    getTopRatedMovies();
    super.initState();
  }

  void getTopRatedMovies() async {
    final http.Response response =
        await http.get("$movieURL?api_key=$apiKey&language=en-US");
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['results'].forEach((movieDetail) {
      final MovieDetail movies = MovieDetail(
        voteAvg: movieDetail['vote_average'],
        title: movieDetail['title'],
        posterURL: movieDetail['poster_path'],
        releaseYear: movieDetail['release_date'].split("-")[0],
      );
      setState(() {
        items.add(movies);
      });
    });
  }

  Future searchMovies(String movieTitle) async {
    final http.Response response =
        await http.get("$searchURL?api_key=$apiKey&query=$movieTitle");
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['results'].forEach((movieDetail) {
      final MovieDetail movies = MovieDetail(
        voteAvg: movieDetail['vote_average'],
        title: movieDetail['title'],
        posterURL: movieDetail['poster_path'],
        releaseYear: movieDetail['release_date'].split("-")[0],
      );
      setState(() {
        items.add(movies);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () async {
            items.clear();
            setState(() {
              getTopRatedMovies();
            });
          },
          child: Text(
            'Top Rated Movies',
            style: Constants.kAppBarTextStyle,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                var typedTitle = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchScreen();
                    },
                  ),
                );
                if (typedTitle != null) {
                  items.clear();
                  setState(() {
                    searchMovies(typedTitle);
                  });
                }
              },
              child: Icon(
                Icons.search,
                size: 34.0,
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF2E87FA),
                  Color(0xFF52C6FC),
                ]),
          ),
        ),
      ),
      body: Container(
        color: Constants.kAppBackgroundColor,
        child: ListView.builder(
          itemCount: this.items.length,
          itemBuilder: _listViewCardBuilder,
        ),
      ),
    );
  }

  Widget _listViewCardBuilder(BuildContext context, int index) {
    var movieDetail = this.items[index];
    return Container(
      height: 120.0,
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Stack(
        children: <Widget>[
          movieCard(movieDetail),
          moviePoster(movieDetail),
        ],
      ),
    );
  }
}
