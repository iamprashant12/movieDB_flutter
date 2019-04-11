import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_people.dart';
import 'package:task_movie_db/widgets/widget_people_card.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {

  List<People> peopleList;
  List<DocumentSnapshot> list;
  CollectionReference collectionReference =
  Firestore.instance.collection('people');
  StreamSubscription<QuerySnapshot> subscription;

  @override
  void initState() {
    super.initState();
    peopleList = new List();
    subscription = collectionReference.snapshots.listen((datasnapShots) {
      list = datasnapShots.documents;
      print(list.length);
      for (int i = 0; i < list.length; i++) {
        setState(() {
          peopleList.add(new People.map(list[i].data));
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
    var size=MediaQuery.of(context).size;
    var height=size.height*0.28;
    var width=size.width/3;
    return new GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: width/height),
        itemCount: peopleList.length,
        itemBuilder: (context, index) => new PeopleCard(index,peopleList[index]));
  }
}
