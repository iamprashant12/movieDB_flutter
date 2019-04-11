import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_people.dart';
import 'package:task_movie_db/people_details_page.dart';

class PeopleCard extends StatelessWidget {
  People people;
  int index;

  PeopleCard(this.index, this.people);

  @override
  Widget build(BuildContext context) {
    return new Hero(
        tag: index,
        child: new GestureDetector(
          child: Card(
            child: new Container(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Flexible(
                    child: new FadeInImage(
                      image: new NetworkImage((people.imageURL)),
                      placeholder: new AssetImage('images/loading.gif'),
                    ),
                    flex: 6,
                  ),
                  new SizedBox(
                    height: 5.0,
                  ),
                  new Flexible(
                    child: new Text(people.name),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new PeopleDetails(index, people))),
        ));
  }
}
