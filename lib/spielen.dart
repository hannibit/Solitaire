import 'package:flutter/material.dart';
import 'package:solitaire_wiprojekt_wise202122/karte.dart';

class PlayPage extends StatelessWidget {
  final kartendeck = new KartenDeck().getKartenDeck();
  PlayPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(this.kartendeck[1].getDateiname()),
      ),
    );
  }
}