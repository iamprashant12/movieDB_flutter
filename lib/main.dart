import 'package:flutter/material.dart';
import 'package:task_movie_db/home_page.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new HomePage(),
    );
  }
}

