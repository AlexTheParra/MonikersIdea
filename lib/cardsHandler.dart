import 'dart:convert';
import 'support.dart';
import 'package:http/http.dart' as http;

class CurrentDeck {

  List<gameCard> cards;

  void add(gameCard card) {
    cards.add(card);
  }

  void removeId(int index) {
    cards.removeAt(index);
  }

  void removeCard(gameCard card) {
    cards.remove(card);
  }

  gameCard getCard(int index) {
    return cards.elementAt(index);
  }

}

class AllCards {

  List<gameCard> allCards;
  List temp;

  void removeId(int index) {
    allCards.removeAt(index);
  }

  void removeCard(gameCard card) {
    allCards.remove(card);
  }

  void getCards() async {
    allCards = new List();
    var resp = await http.get(
      Uri.encodeFull("http://monikers.alexparra.me/getAllCards.php")
    );
    temp = JSON.decode(resp.body);
    for(int i = 0; i < temp.length; i++) {
      allCards.add(new gameCard(temp[i]["Name"], temp[i]["Description"], int.parse( temp[i]["Points"]), temp[i]["Category"]));
    }
  }

  AllCards() {
    getCards();
  }

}