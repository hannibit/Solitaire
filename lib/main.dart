import 'package:flutter/material.dart';
import 'package:solitaire_wiprojekt_wise202122/anleitung.dart';
import 'package:solitaire_wiprojekt_wise202122/spielen.dart';
import 'package:solitaire_wiprojekt_wise202122/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1b5e20),
        primarySwatch: Swatch.color,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solitaire spielen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Solitaire',
              style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayPage()
                    )
                  );
                },
                child: Text(
                    'Spielen',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                    ),
                ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroductionPage()
                    )
                );
              },
              child: Text(
                'Anleitung',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
