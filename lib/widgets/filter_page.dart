import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String groupvalue;
  bool intheatre = false;
  bool betweenDates = false;

  void onchanged(bool value) {
    setState(() {
      intheatre = value;
    });
  }

  void datescheck(bool value) {
    setState(() {
      betweenDates = value;
    });
  }

  void changed(String value) {
    setState(() {
      if (value.compareTo("Most Popular") == 0)
        groupvalue = "Most Popular";
      else if (value.compareTo("Best Rated") == 0)
        groupvalue = "Best Rated";
      else if (value.compareTo("Release Date") == 0)
        groupvalue = "Release Date";
      else if (value.compareTo("Alphabetic Order") == 0)
        groupvalue = "Alphabetic Order";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.only(left: 10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                "Sort By",
                style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new RadioListTile(
                value: "Most Popular",
                groupValue: groupvalue,
                onChanged: (value) => changed(value),
                title: new Text("Most Popular"),
              ),
              new RadioListTile(
                value: "Best Rated",
                groupValue: groupvalue,
                onChanged: (value) => changed(value),
                title: new Text("Best Rated"),
              ),
              new RadioListTile(
                value: "Release Date",
                groupValue: groupvalue,
                onChanged: (value) => changed(value),
                title: new Text("Release Date"),
              ),
              new RadioListTile(
                value: "Alphabetic Order",
                groupValue: groupvalue,
                onChanged: (value) => changed(value),
                title: new Text("Alphabetic Order"),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Divider(
                color: Colors.grey,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new CheckboxListTile(
                value: intheatre,
                onChanged: (value) => onchanged(value),
                title: new Text("In the Theatre now"),
              ),
              new CheckboxListTile(
                value: betweenDates,
                onChanged: (value) => datescheck(value),
                title: new Text("Betweeen two dates"),
              ),
              new Container(
                child: new Wrap(
                  spacing: 5.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    FilterChipWidget(filterChipName: "Action & Adventure" ,),
                    FilterChipWidget(filterChipName: "Animation",),
                    FilterChipWidget(filterChipName: "Comedy",),
                    FilterChipWidget(filterChipName: "Crime",),
                    FilterChipWidget(filterChipName: "Documentry",),
                    FilterChipWidget(filterChipName: "Drama",),
                    FilterChipWidget(filterChipName: "Family",),
                    FilterChipWidget(filterChipName: "Kids",),
                    FilterChipWidget(filterChipName: "Mystery",),
                    FilterChipWidget(filterChipName: "News",),
                    FilterChipWidget(filterChipName: "Reality",),
                    FilterChipWidget(filterChipName: "SCI-FI & Fantasy",),
                    FilterChipWidget(filterChipName: "Soap",),
                    FilterChipWidget(filterChipName: "Talk",),
                    FilterChipWidget(filterChipName: "War & Politics",),
                    FilterChipWidget(filterChipName: "Western",)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String filterChipName;

  FilterChipWidget({Key key, this.filterChipName}) :super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.filterChipName),
      labelStyle: TextStyle(color: Color(0xff6200ee),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: _isSelected,
      backgroundColor: Color(0xffadadad),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color(0xffaadffd),
    );
  }
}
