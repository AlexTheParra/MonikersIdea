import 'package:flutter/material.dart';
import 'support.dart';
import 'cardChoosing.dart';
import 'cardsHandler.dart';

class gameScreen extends StatefulWidget {
  final List<gameValue> values;
  gameScreen({Key key, @required this.values}) : super(key: key); // ignore: missing_function_body
  @override
  gameScreenState createState() => new gameScreenState();
}

class gameScreenState extends State<gameScreen> {

  int _playersLeft;
  int _redLeft;
  int _blueLeft;
  bool _rendered = false;
  CurrentDeck deck;
  AllCards cards;

  void splitN(int n) {
    _playersLeft = n;
    _redLeft = (n/2).truncate();
    _blueLeft = (n/2 + n%2).truncate();
  }

  void _chooseCard(String t) async {
    if (_playersLeft > 0) {
      final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => cardChooser(cards: cards, deck: deck))
      );
      if (result && t == "r") {
        _playersLeft -= 1;
        _redLeft--;
      } else if (result && t=="b") {
        _playersLeft--;
        _blueLeft--;
      }
    } else {
      return;
    }
  }

  void _startGame() {
  }

  @override
  Widget build(BuildContext context) {
    if (!_rendered) {
      splitN(widget.values.elementAt(0).value.truncate());
      cards = new AllCards();
      deck = new CurrentDeck();
    }
    _rendered = true;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Monikers'),
      ),
      body: new Container(
        alignment: Alignment.topLeft,
        child:
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Time to select cards',
                      textAlign: TextAlign.start,
                      style: new TextStyle(fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).accentColor)),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: new Card(
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.person_outline),
                              title: new Text('Blue Team',
                                style: new TextStyle(fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),),
                              subtitle: new Text('You still have $_blueLeft players that need to choose!'),
                            ),
                            new ButtonTheme.bar(
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(onPressed:

                                  _blueLeft == 0 ? null :
                                      () {
                                    setState(() {
                                      _chooseCard("b");
                                    });
                                  }
                                    , child: new Text('CHOOSE CARDS',
                                      style: new TextStyle(
                                          color: Colors.white
                                      ),),
                                    color: Colors.blue,)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: new Card(
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.person_outline),
                              title: new Text('Red Team',
                                style: new TextStyle(fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),),
                              subtitle: new Text('You still have $_redLeft players that need to choose!'),
                            ),
                            new ButtonTheme.bar(
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(onPressed:

                                  _redLeft == 0 ? null :
                                      () {
                                    setState(() {
                                      _chooseCard("r");
                                    });
                                  }, child: new Text('CHOOSE CARDS',
                                    style: new TextStyle(
                                        color: Colors.white
                                    ),),
                                    color: Colors.red,)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  new RaisedButton(
                    onPressed: () {
                      _playersLeft > 0 ? null : _startGame;
                    },
                    child: new Text('START GAME!',
                    style: new TextStyle(
                      color: _playersLeft > 0 ? Colors.black : Colors.white,
                    )),
                    color: _playersLeft > 0 ? Theme.of(context).primaryColorLight : Theme.of(context).accentColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}