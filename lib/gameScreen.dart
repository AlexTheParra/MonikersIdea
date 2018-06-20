import 'package:flutter/material.dart';
import 'support.dart';

class gameScreen extends StatefulWidget {
  final List<gameValue> values;
  gameScreen({Key key, @required this.values}) : super(key: key); // ignore: missing_function_body
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