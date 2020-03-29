import 'package:flutter/material.dart';
import 'package:flutterimdb/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movieTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Movies',
          style: Constants.kAppBarTextStyle,
        ),
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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.movie,
                    color: Colors.white,
                  ),
                  hintText: 'Enter Movie name',
                  hintStyle: Constants.kSearchBarHintTextStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  movieTitle = value;
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, movieTitle);
              },
              child: Text(
                'Search',
                style: Constants.kSearchButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
