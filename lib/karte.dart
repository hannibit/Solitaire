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
  int zuegeCounter = 0;

  var spielen;
  var firstRemoved = false;
  Karte leer = new Karte(42, "Herz");
  List<String> zeichenList = ["herz", "karo", "kreuz", "pik"];

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
        if (card1.farbe.substring(0,3) == card2.farbe.substring(0,3)) {
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
    if (this.karten.length > 0) {
      if (this.kartenIndex > 0) {
        this.karten.removeAt(this.kartenIndex-1);
      }
      else {
        this.karten.removeAt(0);
      }
    }
    if (this.firstRemoved && this.kartenIndex == 2) {
      this.kartenIndex--;
    }
    this.firstRemoved = false;
    if(kartenIndex == 1) {
      this.firstRemoved = true;
      this.kartenIndex--;
    }
    if (this.karten.length == 0) {
      this.spielen.streamRuecken.add(new Karte(42, "Herz"));
    }
  }

  topStapelClick(context) {
    this.spielen = context;
    if (this.karten.length != 0) {
      zuegeCounter++;
      this.anzeigeKarte.clear();
      if (this.kartenIndex > this.karten.length - 1) {
        this.kartenIndex = 0;
        this.anzeigeKarte.add(new Karte(42, "Herz"));
      }
      else {
        if(this.firstRemoved) {
          this.anzeigeKarte.add(this.karten[0]);
          this.firstRemoved = false;
        }
        else {
          this.anzeigeKarte.add(this.karten[this.kartenIndex]);
          this.kartenIndex++;
        }

      }
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
      case 10: return this.fertig1;
      case 11: return this.fertig2;
      case 12: return this.fertig3;
      case 13: return this.fertig4;
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

  karteClick(karte, stapel) {
    ort.clear();
    index.clear();
    if (stapel < 8) {
      for (var i = 1; i < 5; i++) {
        if (this.kannAufeinander(this.gibRichtigenFertig(i).length != 0 ? this.gibRichtigenFertig(i)[this.gibRichtigenFertig(i).length - 1] : null, karte, true)) {
          for (var j = this.gibIndex(this.gibRichtigenStapel(stapel), karte); j < this.gibRichtigenStapel(stapel).length; j++) {
            if (this.wertAufeinanderfolgend(j, this.gibRichtigenStapel(stapel).length)) {
              this.gibRichtigenFertig(i).add(this.gibRichtigenStapel(stapel).elementAt(j));
              this.gibRichtigenStapel(stapel).removeAt(j);
              ort.add('Ablage');
              index.add(i);
              j = 10;
              i = 10;
              zuegeCounter++;
              return true;
            }
            else {
              break;
            }
          }
        }
      }
    }

      for (var i = 1; i < 8; i++) {
        if (this.kannAufeinander(karte, this.gibRichtigenStapel(i).length != 0 ? this.gibRichtigenStapel(i)[this.gibRichtigenStapel(i).length - 1] : null, false)) {
          for (var j = this.gibIndex(this.gibRichtigenStapel(stapel), karte); j < this.gibRichtigenStapel(stapel).length; j++) {
            while (this.gibRichtigenStapel(stapel).length > j) {
              this.gibRichtigenStapel(i).add(this.gibRichtigenStapel(stapel).elementAt(j));
              this.gibRichtigenStapel(stapel).removeAt(j);
            }
            zuegeCounter++;
            ort.add('Stapel');
            index.add(i);
            j = 10;
            i = 10;
            return true;
          }
        }
      }
    return false;
  }

  clear() {
    var counter = 0;
    counter += this.kartenStapel1.length;
    counter += this.kartenStapel2.length;
    counter += this.kartenStapel3.length;
    counter += this.kartenStapel4.length;
    counter += this.kartenStapel5.length;
    counter += this.kartenStapel6.length;
    counter += this.kartenStapel7.length;
    counter += this.karten.length*2;
    if (this.anzeigeKarte.length == 1) {
      counter--;
    }
    this.zuegeCounter += counter;
    this.karten.clear();
    this.anzeigeKarte.clear();
    this.kartenIndex = 0;
    this.kartenStapel1.clear();
    this.kartenStapel2.clear();
    this.kartenStapel3.clear();
    this.kartenStapel4.clear();
    this.kartenStapel5.clear();
    this.kartenStapel6.clear();
    this.kartenStapel7.clear();
    this.fertig1.add(this.findeRichtigesZeichen(this.fertig1));
    this.fertig2.add(this.findeRichtigesZeichen(this.fertig2));
    this.fertig3.add(this.findeRichtigesZeichen(this.fertig3));
    this.fertig4.add(this.findeRichtigesZeichen(this.fertig4));
    this.spielen.streamEmptyDraw.add(new Karte(42, "Herz"));
    this.spielen.streamRuecken.add(new Karte(42, "Herz"));
  }

  void loesbar() {
    if (rueckenStapel1 == 0 && rueckenStapel2 == 0 && rueckenStapel3 == 0 && rueckenStapel4 == 0 && rueckenStapel5 == 0 && rueckenStapel6 == 0 && rueckenStapel7 == 0) {
      this.spielen.streamloesbar.add(true);
    }
    if (this.karten.length == 0) {
      this.spielen.streamEmptyDraw.add(new Karte(42, "Herz"));
    }
  }

  bool manuellLoesen() {
    if (this.kartenStapel1.length == 0 && this.kartenStapel2.length == 0 && this.kartenStapel3.length == 0 && this.kartenStapel4.length == 0 && this.kartenStapel5.length == 0 && this.kartenStapel6.length == 0 && this.kartenStapel7.length == 0 && this.karten.length == 0) {
      return true;
    }
    return false;
  }

  Karte findeRichtigesZeichen(list) {
    if (list.length != 0) {
      switch(list[0].farbe) {
        case 'pik': this.removeFromList("pik"); return new Karte(13, "pik");
        case 'herz': this.removeFromList("herz"); return new Karte(13, "herz");
        case 'karo': this.removeFromList("karo"); return new Karte(13, "karo");
        case 'kreuz': this.removeFromList("kreuz"); return new Karte(13, "kreuz");
      }
    }
    var save = new Karte(13, this.zeichenList[0]);
    this.zeichenList.removeAt(0);
    return save;
  }

  removeFromList(zeichen) {
    for (var i = 0; i < this.zeichenList.length; i++) {
      if (this.zeichenList[i] == zeichen) {
        this.zeichenList.removeAt(i);
      }
    }
  }
}