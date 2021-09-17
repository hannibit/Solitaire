import 'dart:math';

import 'package:flutter/material.dart';
class Karte {
  late String dateiname;
  late int wert;
  late String farbe;

  Karte(int pWert, String pFarbe) {
    this.farbe = pFarbe;
    this.wert = pWert;
    switch (this.wert) {
      case 1 :  dateiname = "playcards/" + farbe + "ass.JPG";

      break;
      case 11 : dateiname = "playcards/" + farbe + "bube.JPG";

      break;
      case 12 : dateiname = "playcards/" + farbe + "dame.JPG";

      break;
      case 13 : dateiname = "playcards/" + farbe + "könig.JPG";

      break;
      default: dateiname = "playcards/" + farbe + this.wert.toString() + ".JPG";

    }
  }

  String getDateiname() {
    return this.dateiname;
  }

  int getWert() {
    return this.wert;
  }

  String getFarbe() {
    return this.farbe;
  }
}

class KartenDeck {
  List<Karte> karten = [];
  int kartenIndex = 1;
  List<Karte> anzeigeKarte = [];

  var rng = new Random();
  List<Karte> kartenStapel1 = [];
  List<Karte> kartenStapel2 = [];
  List<Karte> kartenStapel3 = [];
  List<Karte> kartenStapel4 = [];
  List<Karte> kartenStapel5 = [];
  List<Karte> kartenStapel6 = [];
  List<Karte> kartenStapel7 = [];

  List<Karte> fertig1 = [];
  List<Karte> fertig2 = [];
  List<Karte> fertig3 = [];
  List<Karte> fertig4 = [];

  KartenDeck() {
    for(var i = 1; i < 14; i++) {
      this.karten.add(new Karte(i, "herz"));
      this.karten.add(new Karte(i, "karo"));
      this.karten.add(new Karte(i, "kreuz"));
      this.karten.add(new Karte(i, "pik"));
    }
  }

  List<Karte> getKartenDeck() {
    this.mischen();
    return this.karten;
  }

  void mischen() {
    for(var i = 0; i < 200; i++) {
      var random = this.rng.nextInt(52);
      var speicher = this.karten[random];
      this.karten.removeAt(random);
      this.karten.add(speicher);
    }
    this.kartenStapel1.add(this.karten[51]);
    this.karten.removeAt(51);
    for(var i = 0; i < 2; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel2.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    for(var i = 0; i < 3; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel3.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    for(var i = 0; i < 4; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel4.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    for(var i = 0; i < 5; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel5.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    for(var i = 0; i < 6; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel6.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    for(var i = 0; i < 7; i++) {
      var random = this.rng.nextInt(this.karten.length);
      this.kartenStapel7.add(this.karten[random]);
      this.karten.removeAt(random);
    }
    this.anzeigeKarte.add(this.karten[0]);
  }

  kannAufeinander(card1, card2, end) {
    if (end) {
      if (rotOderSchwarz(card1.farbe) == rotOderSchwarz(card2.farbe)) {
        if (card1.wert == card2.wert--) {
          return true;
        }
      }
      return false;
    }
    else {
      if (rotOderSchwarz(card1.farbe) == rotOderSchwarz(card2.farbe)) {
        if (card1.wert-- == card2.wert) {
          return true;
        }
      }
      return false;
    }
  }

  rotOderSchwarz(cardname) {
    switch(cardname) {
      case 'herz' :
      case 'karo' : return "rot";
      case 'pik' :
      case 'kreuz' : return "schwarz";
    }
  }

  topStapelClick() {
    this.anzeigeKarte.clear();
//    print(this.karten[this.kartenIndex].dateiname);
    this.anzeigeKarte.add(this.karten[this.kartenIndex]);
//    print(this.anzeigeKarte[0].dateiname);
    this.kartenIndex++;
    if (this.kartenIndex == this.karten.length) {
      print("reset");
      this.kartenIndex = 0;
    }
  }

  gibKarte() {
    return this.anzeigeKarte[0];
  }
}