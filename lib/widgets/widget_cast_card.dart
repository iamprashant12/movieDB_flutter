import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  String url;

  CastCard(this.url);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Container(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 15.0,
            ),
            new CircleAvatar(
              backgroundImage: new NetworkImage(url),
              radius: 55.0,
            ),
            new SizedBox(
              height: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
