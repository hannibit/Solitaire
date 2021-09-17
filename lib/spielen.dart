import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solitaire_wiprojekt_wise202122/karte.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PlayPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => PlayPage(),
      ),
    );
  }

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  var oberklasse = new KartenDeck();
  var kartendeck;

  final streamcntr = StreamController<Karte>();

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => {},
    onChangeRawSecond: (value) => {},
    onChangeRawMinute: (value) => {},
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    this.kartendeck = this.oberklasse.getKartenDeck();

    _stopWatchTimer.rawTime.listen((value) => {});
    _stopWatchTimer.minuteTime.listen((value) => {});
    _stopWatchTimer.secondTime.listen((value) => {});
    _stopWatchTimer.records.listen((value) => {});

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final zahl = ModalRoute.of(context)!.settings.arguments;
    if (zahl == 1) {
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Abbrechen'),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value, hours: _isHours);
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime,
                          style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
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
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {
                          this.oberklasse.topStapelClick();
                          streamcntr.add(this.oberklasse.gibKarte());
                        },
                        child: Image.asset('playcards/ruecken.JPG'),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: StreamBuilder(
                          stream: streamcntr.stream,
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData){
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {},
                                child: this.oberklasse.anzeigeKarte.length > 0
                                    ? Image.asset(this
                                    .oberklasse
                                    .anzeigeKarte[0]
                                    .getDateiname())
                                    : Image.asset('playcards/versuch.png'),
                              );
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              onPressed: () {},
                              child: Container(child: Image.asset(card.getDateiname())),
                            );
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: Image.asset(this.kartendeck[1].getDateiname()),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
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
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Image.asset('playcards/ruecken.JPG'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length >= 7
                                ? Image.asset('playcards/ruecken.JPG')
                                : this.oberklasse.kartenStapel7.length == 6
                                    ? Image.asset(this
                                        .oberklasse
                                        .kartenStapel7[5]
                                        .getDateiname())
                                    : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 7
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[6]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 8
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[7]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 9
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[8]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 10
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[9]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 300,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 11
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[10]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 12
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[11]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 13
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[12]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 390,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 14
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[13]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 15
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[14]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 16
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[15]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 17
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[16]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 510,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 18
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[17]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 540,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: this.oberklasse.kartenStapel7.length == 19
                                ? Image.asset(this
                                    .oberklasse
                                    .kartenStapel7[18]
                                    .getDateiname())
                                : Image.asset('playcards/versuch.png'),
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
