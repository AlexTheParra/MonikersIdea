import 'package:flutter/material.dart';

class gameScreen extends StatefulWidget {
  @override
  gameScreenState createState() => new gameScreenState();
}

class gameScreenState extends State<gameScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Monikers'),
      ),
      body: new Center(

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Why isn\'t this working'),
          ],
        ),
      ),
    );
  }
}