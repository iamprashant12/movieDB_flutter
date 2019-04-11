import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_movies.dart';
import 'package:task_movie_db/widgets/widget_cast_card.dart';
import 'package:task_movie_db/widgets/widget_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatelessWidget {

  final dynamic item;
  final int index;

  DetailsPage(this.index, [this.item]);

  updateData()
  {
    print("Can update data");
    //due to the issue of firestore not exposing the documentID i cant change the saved field in app
  }
//  async {
//    Map<String,dynamic> data=<String,dynamic>{
//      'name':item.name,
//      'genre':item.name,
//      'rating':item.rating,
//      'description':item.description,
//      'cast':item.cast,
//      'saved':item.saved,
//      'imageURL':item.imageURL
//    };
//    var docref=await Firestore.instance.collection('movies').add(data);
//    DocumentReference reference=Firestore.instance.collection('movies').document(docref.documentID);
//    reference.updateData(<String,dynamic>{
//      'name':item.name,
//      'genre':item.name,
//      'rating':item.rating,
//      'description':item.description,
//      'cast':item.cast,
//      'saved':!item.saved,
//      'imageURL':item.imageURL
//    });
//  }
  @override
  Widget build(BuildContext context) {
    List<String> list = item.cast;
    var size = MediaQuery.of(context).size;
    var height = size.height / 4;
    var width = size.width / 3;
    return new Hero(
        tag: index,
        child: Scaffold(
          body: new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: 200.0,
                pinned: true,
                title: new Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: new Image.network(
                    item.imageURL,
                    fit: BoxFit.fill,
                  ),
                ),
                actions: <Widget>[
                  new IconButton(icon: Icon(Icons.star_border), onPressed: ()=>updateData())
                ],
              ),
              new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new Container(
                          padding: EdgeInsets.only(
                              left: 18.0, right: 18.0, bottom: 18.0, top: 22.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new Image.network(item.imageURL),
                                    flex: 1,
                                  ),
                                  new SizedBox(
                                    width: 10.0,
                                  ),
                                  new Expanded(
                                      flex: 2,
                                      child: new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            item.name,
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.00),
                                          ),
                                          new SizedBox(
                                            height: 5.0,
                                          ),
                                          new Text(
                                            item.genre,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey),
                                          ),
                                          new SizedBox(
                                            height: 10.0,
                                          ),
                                          new IconTheme(
                                            data: IconThemeData(
                                              color: Colors.amber,
                                            ),
                                            child: new StarDisplay(
                                              value: item.rating,
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              new SizedBox(
                                height: 13.0,
                              ),
                              new Divider(
                                color: Colors.grey,
                              ),
                              new SizedBox(
                                height: 13.0,
                              ),
                              new Container(
                                child: new Text(
                                  item.description,
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                ),
                              ),
                              new SizedBox(
                                height: 14.0,
                              ),
                              new Text(
                                "Cast",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.grey),
                              ),
                              new Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                    childCount: 1),
              ),
              new SliverGrid(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: width / height),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => new CastCard(list[index]),
                    childCount: list.length),
              )
            ],
          ),
        ));
  }
}
