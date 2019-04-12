import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_movies.dart';
import 'package:task_movie_db/widgets/widget_custom_card.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<Movie> commonList;
  List<DocumentSnapshot> list;
  CollectionReference collectionReferenceSeries =
      Firestore.instance.collection('series');
  CollectionReference collectionReferenceMovies =
      Firestore.instance.collection('movies');
  StreamSubscription<QuerySnapshot> subscriptionSeries;
  StreamSubscription<QuerySnapshot> subscriptionMovies;

  @override
  void initState() {
    commonList = new List();
    subscriptionSeries =
        collectionReferenceSeries.snapshots.listen((datasnapShots) {
      list = datasnapShots.documents;
      List<Movie> seriesList = new List();
      list.forEach((series) {
        Movie m=new Movie.map(series.data);
        if(m.saved)
        seriesList.add(m);
      });
      setState(() {
        commonList.addAll(seriesList);
      });
    });
    subscriptionMovies =
        collectionReferenceMovies.snapshots.listen((dataSnapshots) {
      list = dataSnapshots.documents;
      List<Movie> movieList = new List();
      list.forEach((movie) {
        Movie m=new Movie.map(movie.data);
        if(m.saved)
          movieList.add(m);
      });
      setState(() {
        commonList.addAll(movieList);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscriptionSeries.cancel();
    subscriptionMovies.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height * 0.33;
    var width = size.width / 3;
    return (commonList.length == 0
        ? new Center(
            child: new Text("Empty List"),
          )
        : new GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: width / height),
            itemCount: commonList.length,
            itemBuilder: (context, index) =>
                new CustomCard(index, commonList[index])));
  }
}
