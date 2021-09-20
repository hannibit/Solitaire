import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('So wird gespielt!'),
            ),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text('''Solitär – Die Spielregeln

Von diesem bekannten Kartenspiel gibt es viele Varianten. Hier werden die Regeln der klassischen Version erklärt.

Die Runde beginnt mit sieben Stapeln, deren jeweils erste Karte aufgedeckt ist.
24 Karten werden daneben aufgestapelt. Aus diesem „Stock“ lassen sich weitere Karten ziehen. 
Hat man das Ende des Stocks erreicht, beginnt dieser von vorne.
    
Karten dürfen auf andere offene Karten gelegt werden, wenn diese in der Reihenfolge passen und die entgegengesetzt Farbe besitzen: eine Herz Sieben darf auf eine Kreuz Acht oder Pik Acht gelegt werden.
Bewegt werden die Karten einzeln oder in der Längstreihe.
Dabei werden nach und nach auch verdeckte Karten freigelegt, die dann benutzt werden können.
    
Ziel des Spieles ist es, vier Stapel mit je derselben Farbe und demselben Zeichen beginnend beim Ass bis zum König zu bilden, die sogenannten „Stacks“.
    
Achtung: Der Zufall kann darüber entscheiden, ob ein Spiellauf beendet werden kann.''',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, wordSpacing: 1.5))))
            ]))));
  }
}
