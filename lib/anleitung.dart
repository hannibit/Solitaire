import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('So wird gespielt!'),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Center(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: [
                              Text(
                                  '''Solitär – Die Spielregeln

Von diesem bekannten Kartenspiel gibt es viele Varianten. Hier werden die Regeln der klassischen Version erklärt.

Die Runde beginnt mit sieben Stapeln, deren jeweils erste Karte aufgedeckt ist.
24 Karten werden daneben aufgestapelt. Aus diesem „Stock“ lassen sich weitere Karten ziehen.
Hat man das Ende des Stocks erreicht, beginnt dieser von vorne.''',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 25,
                                      wordSpacing: 1.5),
                              ),
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    children: [
                                      Container(width: 20, height: 20,),
                                      Image.asset('manual/start_konfig.png'),
                                      Container(width: 20, height: 20,),
                                    ],
                                  )
                              ),
                              Text(
                                '''Karten dürfen auf andere offene Karten gelegt werden, wenn diese in der Reihenfolge passen und die entgegengesetzt Farbe besitzen: eine Herz Sieben darf auf eine Kreuz Acht oder Pik Acht gelegt werden.
Bewegt werden die Karten einzeln oder in der Längsreihe.
Dabei werden nach und nach auch verdeckte Karten freigelegt, die dann benutzt werden können.''',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25,
                                    wordSpacing: 1.5),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('manual/move_card.png'),
                                    Container(width: 20, height: 10,),
                                    Image.asset('manual/move_row.png'),
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Image.asset('manual/uncover1.png'),
                                    Container(width: 20, height: 10,),
                                    Image.asset('manual/uncover2.png'),
                                  ],
                                ),
                              ),
                              Text(
                                '''Ziel des Spieles ist es, vier Stapel mit je derselben Farbe und demselben Zeichen beginnend beim Ass bis zum König zu bilden, die sogenannten „Stacks“.''',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25,
                                    wordSpacing: 1.5),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Image.asset('manual/finish_button.png'),
                                    Container(width: 10, height: 10,),
                                    Image.asset('manual/finished.png'),
                                  ],
                                ),
                              ),
                              Text(
                                '''Achtung: Der Zufall kann darüber entscheiden, ob ein Spiellauf beendet werden kann.''',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25,
                                    wordSpacing: 1.5),
                              ),
                            ],
                          ),
                      ),
                  ),
                ],
            ),
        ),
    );
  }
}
