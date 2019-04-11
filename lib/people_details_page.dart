import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_people.dart';

class PeopleDetails extends StatelessWidget{
  final int index;
  final People people;
  PeopleDetails(this.index,this.people);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            title: new Text(
              people.name,
            ),
            flexibleSpace: new FlexibleSpaceBar(
              background: new Image.network(
                people.imageURL,
                fit: BoxFit.fill,
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) {
              return new Container(
                padding: EdgeInsets.only(
                    left: 15.0, top: 25.0, right: 15.0, bottom: 15.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      people.name,
                      style: new TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    new SizedBox(
                      height: 5.0,
                    ),
                    new Text("Place of Birth:"+people.pob,style: new TextStyle(fontSize: 16.0,color: Colors.grey),),
                    new SizedBox(height: 3.0,),
                    new Text("Birthday:"+people.dob,style: new TextStyle(fontSize: 16.0,color: Colors.grey),),
                    new SizedBox(
                      height: 13.0,
                    ),
                    new Divider(color: Colors.grey,),
                    new SizedBox(
                      height: 13.0,
                    ),
                    new Text(people.description,style: new TextStyle(fontSize: 16.0,color: Colors.grey),)
                  ],
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}
