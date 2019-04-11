import 'package:flutter/material.dart';
import 'package:task_movie_db/models/model_movies.dart';
import 'package:task_movie_db/details_page_movie_series.dart';

class CustomCard extends StatelessWidget {
  final Movie movie;
  final int index;

  CustomCard(this.index, this.movie);

  @override
  Widget build(BuildContext context) {
    dynamic item = movie;
    return GestureDetector(
      child: new Hero(
          tag: index,
          child: Container(
            //height: 250.0,
            //width: 150.0,
            child: new Card(
              elevation: 15.0,
              child: new Container(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Flexible(child: new FadeInImage(
                      placeholder: new AssetImage(
                        'images/loading.gif',
                      ),
                      image: NetworkImage(item.imageURL),
                      fit: BoxFit.fill,
                    ),flex: 6,),
                    new Flexible(child: new Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.w700),
                    ),flex: 1,)
                  ],
                ),
              ),
            ),
          )),
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailsPage(index, item))),
    );
  }
}
