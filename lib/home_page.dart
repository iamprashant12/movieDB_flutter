import 'package:flutter/material.dart';
import 'package:task_movie_db/movies_page.dart';
import 'package:task_movie_db/people_page.dart';
import 'package:task_movie_db/saved_page.dart';
import 'package:task_movie_db/series_page.dart';
import 'package:task_movie_db/widgets/filter_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Movie DB"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.filter_list), onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new FilterPage()));}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
        ],
        bottom: TabBar(controller: tabController, tabs: [
          new Tab(
            text: "Movies",
          ),
          new Tab(
            text: "Series",
          ),
          new Tab(
            text: "Saved",
          ),
          new Text("People")
        ]),
      ),
      body: new TabBarView(controller: tabController, children: <Widget>[
        new MoviesPage(),
        new SeriesPage(),
        new SavedPage(),
        new PeoplePage(),
      ]),
    );
  }
}
