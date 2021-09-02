import 'package:flutter/material.dart';

class PlayPage extends StatelessWidget {
  PlayPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spiel gestartet'),
      ),
      body: Center(
        child: Text(
            'Hier gehts rund!',
            style: TextStyle(
                fontSize: 100.0,
                fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}