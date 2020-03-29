import 'package:flutter/material.dart';

class Constants {
  static const Color kSplashScreenBackgroundColor = Color(0xFFf3ce13);
  static const Color kAppBackgroundColor = Color(0xFF3E3862);
  static const Color kMovieCardColor = Color(0xFF444173);
  static const Color kMovieCardContainerColor = Color(0xFF00C6FF);

  static const TextStyle kSplashScreenTextStyle = TextStyle(
    color: Color(0xFF191919),
    fontWeight: FontWeight.bold,
    fontSize: 190,
    letterSpacing: 5.0,
    fontFamily: 'Kenyc',
  );

  static const TextStyle kAppBarTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 28.0,
  );

  static const TextStyle kMovieTitleTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );

  static const TextStyle kMovieReleaseYearTextStyle = TextStyle(
    color: Color(0x66FFFFFF),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 15.0,
  );

  static const TextStyle kMovieRatingTextStyle = TextStyle(
    color: Color(0x66FFFFFF),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 15.0,
  );

  static const TextStyle kSearchBarHintTextStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'Poppins',
  );

  static const TextStyle kSearchButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 26.0,
    fontFamily: 'Poppins',
  );
}
