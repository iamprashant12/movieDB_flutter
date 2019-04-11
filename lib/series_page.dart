import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_movie_db/models/model_movies.dart';
import 'dart:async';
import 'package:task_movie_db/widgets/widget_custom_card.dart';

class SeriesPage extends StatefulWidget {
  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  List<Movie> seriesList;
  List<DocumentSnapshot> list;
  CollectionReference collectionReference =
  Firestore.instance.collection('series');
  StreamSubscription<QuerySnapshot> subscription;

  @override
  void initState() {
    super.initState();
    seriesList = new List();
    subscription = collectionReference.snapshots.listen((datasnapShots) {
      list = datasnapShots.documents;
      print(list.length);
      for (int i = 0; i < list.length; i++) {
        setState(() {
          seriesList.add(new Movie.map(list[i].data));
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
    return (seriesList.length == 0
        ? new Center(
      child: new Text("Empty List"),
    )
        : new GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: width / height),
        itemCount: seriesList.length,
        itemBuilder: (context, index) =>
        new CustomCard(index, seriesList[index])));
  }
}
