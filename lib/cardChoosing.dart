import 'package:flutter/material.dart';
import 'support.dart';

class cardChooser extends StatefulWidget {

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

  @override
  Widget build(BuildContext context) {
    newList();
    return new Scaffold(
      appBar: new AppBar(
        leading: new Container(),
        title: new Text('Choose Cards'),
      ),
      // ignore: expected_token
      body: new Container(
        alignment: Alignment.topLeft,
        child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('Choose 5 cards!',
                style: new TextStyle(fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).accentColor),),
              new ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){

                  return new Card(
                    child: new Column(
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Example Card $index',
                            style: new TextStyle(
                                color: tiles[index] ? Colors.purple : Colors.black
                            ),),
                          subtitle: new Text('This is some example card explanation/description.'),
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
                        ),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}