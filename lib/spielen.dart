import 'package:flutter/material.dart';
import 'package:solitaire_wiprojekt_wise202122/karte.dart';

class PlayPage extends StatelessWidget {
  final kartendeck = new KartenDeck().getKartenDeck();

  PlayPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abbrechen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset('playcards/ruecken.JPG'),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset('playcards/ruecken.JPG'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset(this.kartendeck[1].getDateiname()),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                                Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                            onPressed: () {},
                            child:
                            Image.asset(this.kartendeck[1].getDateiname()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}