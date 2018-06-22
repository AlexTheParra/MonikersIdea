import 'package:flutter/material.dart';
import 'support.dart';
import 'gameScreen.dart';

class newGame extends StatefulWidget {
  @override
  newGameScreen createState() => new newGameScreen();
}

class newGameScreen extends State<newGame> {

  int _currentPlayers = 2;

  void _changeCurrPlayers(int players) {
    _currentPlayers = players;
  }

  double _minPerRound = .5;

  void _changeMPR(double mpr){
    _minPerRound = mpr;
  }
  @override
  Widget build(BuildContext context) {return new Scaffold(
    appBar: new AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: new Text('New Game'),
    ),
    body: new Container(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      alignment: Alignment.topLeft,
      child:
      new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Choose your preferences',
              style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor
              ),
            ),
            new Card(
              child: new Column(
                children: <Widget> [
                  new Padding(padding: new EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text('Number of Players: $_currentPlayers',
                                textAlign: TextAlign.left),
                          ],
                        ),
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Slider(
                                  label: "Number of Players: $_currentPlayers",
                                  value: _currentPlayers.toDouble(),
                                  max: 6.0,
                                  min: 2.0,
                                  divisions: 4,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _changeCurrPlayers(newValue.round());
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                children: <Widget> [new Padding(padding: new EdgeInsets.all(20.0),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text('Number of Minutes Per Round: $_minPerRound',
                              textAlign: TextAlign.left),
                        ],
                      ),
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Slider(
                                label: "Number of M/R: $_minPerRound",
                                value: _minPerRound,
                                max: 2.0,
                                min: .5,
                                divisions: 6,
                                onChanged: (double newValue) {
                                  setState(() {
                                    _changeMPR(newValue);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
            new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: new RaisedButton(
                  onPressed: () {
                    List<gameValue> vals = new List();
                    vals.add(new gameValue(
                        "currPlayer",
                        _currentPlayers.toDouble()));
                    vals.add(new gameValue(
                        "mPr",
                        _minPerRound
                    ));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => gameScreen(values: vals)));
                  },
                  child: new Text(
                    'Start a game!',
                    style: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                )
            ),
          ],
        ),
      ),
    ),
    // This trailing comma makes auto-formatting nicer for build methods.
  );
  }

}