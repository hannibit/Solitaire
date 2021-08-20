import 'package:flutter/material.dart';
import 'package:solitaire_wiprojekt_wise202122/spielen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData(
        backgroundColor: Color(0xff1b5e20),
        primarySwatch: Colors.green,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Solitaire',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayPage()
                    )
                  );
                },
                child: Text('Spielen')
            ),
          ],
        ),
      ),
    );
  }
}
