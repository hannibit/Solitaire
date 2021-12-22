import 'dart:math';

class Karte {
  late String dateiname;
  late int wert;
  late String farbe;

  Karte(int pWert, String pFarbe) {
    this.farbe = pFarbe;
    this.wert = pWert;
    switch (this.wert) {
      case 42: dateiname = 'playcards/versuch.png';
      break;
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
  int kartenIndex = 0;
  List<Karte> anzeigeKarte = [];

  int rueckenStapel1 = 0;
  int rueckenStapel2 = 1;
  int rueckenStapel3 = 2;
  int rueckenStapel4 = 3;
  int rueckenStapel5 = 4;
  int rueckenStapel6 = 5;
  int rueckenStapel7 = 6;

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

  List<String> ort = [];
  List<int> index = [];

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
      if (card1 != null) {
        if (rotOderSchwarz(card1.farbe) == rotOderSchwarz(card2.farbe)) {
          if (this.wertAufeinanderfolgend(card1.wert, card2.wert)) {
            return true;
          }
        }
      }
      else {
        if (this.wertAufeinanderfolgend(0, card2.wert)) {
          return true;
        }
      }
      return false;
    }
    else {
      if (card2 != null) {
        if (rotOderSchwarz(card1.farbe) != rotOderSchwarz(card2.farbe)) {
          if (this.wertAufeinanderfolgend(card1.wert, card2.wert)) {
            return true;
          }
        }
      }
      else {
        if (this.wertAufeinanderfolgend(card1.wert, 14)) {
          return true;
        }
      }
      return false;
    }
  }

  wertAufeinanderfolgend(zahl1, zahl2) {
    return zahl1+1 == zahl2;
  }

  rotOderSchwarz(cardname) {
    switch(cardname.substring(0,3)) {
      case 'her' :
      case 'kar' : return "rot";
      case 'pik' :
      case 'kre' : return "schwarz";
    }
  }
  
  topStapelRemove() {
    print(this.karten);
    print(this.karten[this.kartenIndex-1].getDateiname());
    this.karten.removeAt(this.kartenIndex-1);
    print(this.karten);
  }

  topStapelClick() {
    this.anzeigeKarte.clear();
    print(this.kartenIndex);
    if (this.kartenIndex > this.karten.length -1) {
      this.kartenIndex = 0;
      this.anzeigeKarte.add(new Karte(42, "Herz"));
    }
    else {
      this.anzeigeKarte.add(this.karten[this.kartenIndex]);
      this.kartenIndex++;
    }
  }

  gibStapelKarte() {
    return this.anzeigeKarte[0];
  }

  gibIndex(list, karte) {
    for (var i = 0; i < list.length; i++) {
      if (list[i] == karte) {
        return i;
      }
    }
    return -1;
  }

  gibRichtigenStapel(nummer) {
    switch (nummer) {
      case 0: return this.anzeigeKarte;
      case 1: return this.kartenStapel1;
      case 2: return this.kartenStapel2;
      case 3: return this.kartenStapel3;
      case 4: return this.kartenStapel4;
      case 5: return this.kartenStapel5;
      case 6: return this.kartenStapel6;
      case 7: return this.kartenStapel7;
    }
  }

  gibRichtigenFertig(nummer) {
    switch (nummer) {
      case 1: return this.fertig1;
      case 2: return this.fertig2;
      case 3: return this.fertig3;
      case 4: return this.fertig4;
    }
  }

  karteClick(karte, stapel) { //noch nicht bedacht wie weg vom fertig stapel und vom Draw Stapel gehen soll
    ort.clear();
    index.clear();
      for (var i = 1; i < 5; i++) {
        if (this.kannAufeinander(this
            .gibRichtigenFertig(i)
            .length != 0 ? this.gibRichtigenFertig(i)[this
            .gibRichtigenFertig(i)
            .length - 1] : null, karte, true)) {
          for (var j = this.gibIndex(
              this.gibRichtigenStapel(stapel), karte); j < this
              .gibRichtigenStapel(stapel)
              .length; j++) {
//          print(i); //kartenstapel auf den angelegt werden kann
//          print(j); //wenn mehrere dann abbruch weil karten drauf liegen (also nicht erreichbar)
            if (this.wertAufeinanderfolgend(j, this
                .gibRichtigenStapel(stapel)
                .length)) {
              this.gibRichtigenFertig(i).add(
                  this.gibRichtigenStapel(stapel).elementAt(j));
              this.gibRichtigenStapel(stapel).removeAt(j);
            }
            ort.add('Ablage');
            index.add(i);
            j = 10;
            i = 10;
            this.printAll();
            return true;
          }
        }
      }

      for (var i = 1; i < 8; i++) {
        if (this.kannAufeinander(karte, this
            .gibRichtigenStapel(i)
            .length != 0 ? this.gibRichtigenStapel(i)[this
            .gibRichtigenStapel(i)
            .length - 1] : null, false)) {
          for (var j = this.gibIndex(
              this.gibRichtigenStapel(stapel), karte); j < this
              .gibRichtigenStapel(stapel)
              .length; j++) {
//          print(i); //kartenstapel auf den angelegt werden kann
//          print(j);
            while (this
                .gibRichtigenStapel(stapel)
                .length > j) {
              this.gibRichtigenStapel(i).add(
                  this.gibRichtigenStapel(stapel).elementAt(j));
              this.gibRichtigenStapel(stapel).removeAt(j);
            }
            ort.add('Stapel');
            index.add(i);
            j = 10;
            i = 10;
            this.printAll();
            return true;
          }
        }
      }
    return false;
  }

  printAll() {
    print(this.kartenStapel1);
    print(this.kartenStapel2);
    print(this.kartenStapel3);
    print(this.kartenStapel4);
    print(this.kartenStapel5);
    print(this.kartenStapel6);
    print(this.kartenStapel7);
    print(this.fertig1);
    print(this.fertig2);
    print(this.fertig3);
    print(this.fertig4);
  }
}