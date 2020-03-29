import 'package:flutter/material.dart';
import 'package:flutterimdb/constants.dart';
import 'package:flutterimdb/models/movie_detail.dart';

Widget movieCard(MovieDetail movieDetail) {
  return Container(
    margin: EdgeInsets.only(left: 72.0, right: 24.0),
    decoration: BoxDecoration(
      color: Constants.kMovieCardColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 10.0)),
      ],
    ),
    child: Container(
      margin: EdgeInsets.only(top: 16.0, left: 72.0, bottom: 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              movieDetail.title,
              style: Constants.kMovieTitleTextStyle,
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.calendar_today, size: 14.0, color: Color(0x66FFFFFF)),
              SizedBox(width: 2.0),
              Text(
                movieDetail.releaseYear,
                style: Constants.kMovieReleaseYearTextStyle,
              ),
            ],
          ),
          Container(
            color: Constants.kMovieCardContainerColor,
            width: 24.0,
            height: 1.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star, size: 14.0, color: Color(0x66FFFFFF)),
              Text(
                movieDetail.voteAvg.toString(),
                style: Constants.kMovieRatingTextStyle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
