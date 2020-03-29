import 'package:flutter/material.dart';
import 'package:flutterimdb/models/movie_detail.dart';

const imageURL = 'https://image.tmdb.org/t/p/w500/';
Widget moviePoster(MovieDetail movieDetail) {
  return Container(
    alignment: FractionalOffset(0.0, 0.5),
    margin: EdgeInsets.only(left: 24.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: movieDetail.posterURL == null
          ? null
          : Image.network(imageURL + movieDetail.posterURL,
              fit: BoxFit.fitWidth),
    ),
  );
}
