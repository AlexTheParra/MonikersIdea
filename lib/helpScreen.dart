import 'package:flutter/material.dart';

class helpScreen extends StatefulWidget {

  helpScreenState createState() => helpScreenState();
}

class helpScreenState extends State<helpScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rules and FAQs'),
      ),
      body: new Container(
          alignment: Alignment.topLeft,
          child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Card(
                      child: new Column(
                        children: <Widget>[
                          const ListTile(
                            title: const Text('Rule 1'),
                            subtitle: const Text('This is an example rule.'),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}