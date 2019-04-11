import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_movies.dart';
import 'package:task_movie_db/widgets/widget_custom_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> movieList;
  List<DocumentSnapshot> list;
  CollectionReference collectionReference =
      Firestore.instance.collection('movies');
  StreamSubscription<QuerySnapshot> subscription;

  @override
  void initState() {
    super.initState();
    movieList = new List();
    subscription = collectionReference.snapshots.listen((datasnapShots) {
      list = datasnapShots.documents;
      for (int i = 0; i < list.length; i++) {
        setState(() {
          movieList.add(new Movie.map(list[i].data));
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height * 0.33;
    var width = size.width / 3;
    return (movieList.length == 0
        ? new Center(
            child: new Text("Empty List"),
          )
        : new GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: width / height),
            itemCount: movieList.length,
            itemBuilder: (context, index) =>
                new CustomCard(index, movieList[index])));
  }
}
