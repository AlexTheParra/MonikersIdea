import 'dart:async';

import 'support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void removeId(int index) {
    allCards.removeAt(index);
  }

  void removeCard(gameCard card) {
    allCards.remove(card);
  }

  void getCards() async {
    allCards = new List();
    QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
  }

  AllCards() {
    getCards();
  }

}