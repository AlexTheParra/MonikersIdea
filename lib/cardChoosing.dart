import 'package:flutter/material.dart';
import 'support.dart';
import 'cardsHandler.dart';

class cardChooser extends StatefulWidget {
  final CurrentDeck deck;
  final AllCards cards;

  cardChooser({Key key, @required this.deck, @required this.cards}) : super(key : key);

  cardChooserScreen createState() => cardChooserScreen();
}

class cardChooserScreen extends State<cardChooser> {

  List<bool> tiles;

  void newList() {
    if (tiles == null) {
      tiles = new List();
      for (int i = 0; i < 10; i++) {
        tiles.add(false);
      }
    }
  }

  bool onlyFive() {
    int nTiles = 0;

    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i]) {
        nTiles++;
      }
    }

    return nTiles == 5;
  }

  Icon getIcon(String name) {
    Icon i;
    switch(name) {
      case "Historical Figures":
        i = new Icon(Icons.person_outline);
        break;
      case "Fictional Characters":
        i = new Icon(Icons.cloud_queue);
        break;
      case "Et Cetera":
        i = new Icon(Icons.add);
        break;
      case "Celebrity":
        i = new Icon(Icons.star_border);
        break;
      default:
        i = new Icon(Icons.sim_card_alert);
        break;
    }
    return i;
  }

  Icon getPoints(int p) {
    Icon i;
    switch(p) {
      case 1:
        return new Icon(Icons.filter_1);
      case 2:
        return new Icon(Icons.filter_2);
      case 3:
        return new Icon(Icons.filter_3);
      case 4:
        return new Icon(Icons.filter_4);
    }
    return i;
  }

  @override
  Widget build(BuildContext context) {
    newList();
    return new Scaffold(
      appBar: new AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: new Text('Choose Cards'),
      ),
      // ignore: expected_token
      body: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    leading: index <= widget.cards.allCards.length-1 ? getIcon(widget.cards.allCards.elementAt(index).category) : null,
                    title: new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                      child: new Text(index <= widget.cards.allCards.length-1 ? widget.cards.allCards.elementAt(index).name : 'Example Card $index',
                        style: new TextStyle(
                            color: tiles[index] ? Colors.purple : Colors.black
                        ),
                      ),
                    ),
                    subtitle: new Padding(
                      padding: new EdgeInsets.only(bottom: 10.0),
                      child: new Text(index <= widget.cards.allCards.length-1 ? widget.cards.allCards.elementAt(index).desc :
                    'This is some example card explanation/description.'),
            ),
                    onTap: () {
                      setState(() {
                        if (tiles[index]) {
                          tiles[index] = false;
                        } else {
                          tiles[index] = true;
                        }
                      });
                    },
                    enabled: true,
                    trailing: index <= widget.cards.allCards.length-1 ? getPoints(widget.cards.allCards.elementAt(index).points) : null,
                  ),
                ],
              ),
            );
          }
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          if (onlyFive()) {
            Navigator.pop(context, true);
          }
        },
        backgroundColor: !onlyFive() ? Colors.grey : Theme.of(context).accentColor,
        child: new Icon(Icons.check),
      ),
    );
  }
}