import 'package:flutter/material.dart';
import 'package:flutterimdb/screens/movie_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutterimdb/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MovieScreen(),
      title: Text(
        'IMDb',
        style: Constants.kSplashScreenTextStyle,
      ),
      backgroundColor: Constants.kSplashScreenBackgroundColor,
    );
  }
}
