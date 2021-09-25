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

  final streamDraw = StreamController<Karte>();
  final streamAblage1 = StreamController<Karte>();
  final streamAblage2 = StreamController<Karte>();
  final streamAblage3 = StreamController<Karte>();
  final streamAblage4 = StreamController<Karte>();
  final streamStapel1 = StreamController<Karte>();
  final streamStapel2 = StreamController<Karte>();
  final streamStapel3 = StreamController<Karte>();
  final streamStapel4 = StreamController<Karte>();
  final streamStapel5 = StreamController<Karte>();
  final streamStapel6 = StreamController<Karte>();
  final streamStapel7 = StreamController<Karte>();

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => {},
    onChangeRawSecond: (value) => {},
    onChangeRawMinute: (value) => {},
  );

  void streamAdd(Karte karte) {
    final ort = this.oberklasse.ort[0];
    final index = this.oberklasse.index[0];
    switch (ort) {
      case 'Ablage':
        switch (index) {
          case 1:
            streamAblage1.add(karte);
            return;
          case 2:
            streamAblage2.add(karte);
            return;
          case 3:
            streamAblage3.add(karte);
            return;
          case 4:
            streamAblage4.add(karte);
            return;
        }
        return;
      case 'Stapel':
        switch (index) {
          case 1:
            streamStapel1.add(karte);
            return;
          case 2:
            streamStapel2.add(karte);
            return;
          case 3:
            streamStapel3.add(karte);
            return;
          case 4:
            streamStapel4.add(karte);
            return;
          case 5:
            streamStapel5.add(karte);
            return;
          case 6:
            streamStapel6.add(karte);
            return;
          case 7:
            streamStapel7.add(karte);
            return;
        }
        return;
    }
  }

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
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
    streamDraw.close();
    streamAblage1.close();
    streamAblage2.close();
    streamAblage3.close();
    streamAblage4.close();
    streamStapel1.close();
    streamStapel2.close();
    streamStapel3.close();
    streamStapel4.close();
    streamStapel5.close();
    streamStapel6.close();
    streamStapel7.close();
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fontSize: 25, fontWeight: FontWeight.normal),
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
            //oberer Reihe
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Stapel
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
                            streamDraw.add(this.oberklasse.gibStapelKarte());
                          },
                          child: Image.asset('playcards/ruecken.JPG'),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: StreamBuilder(
                            stream: streamDraw.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              final card = snapshot.data;
                              if (!snapshot.hasData) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {
                                    //TODO: Karten vom Stapel hier nehmen
                                    streamAdd(this.oberklasse.anzeigeKarte[0]);
                                  },
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
                                child: Container(
                                    child: Image.asset(card.getDateiname())),
                              );
                            }),
                      ),
                    ],
                  ),
                  //Ablage
                  //TODO: Karten von der Ablage nehmen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        child: StreamBuilder(
                            stream: streamAblage1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              final card = snapshot.data;
                              if (!snapshot.hasData) {
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
                                child: Container(
                                    child: Image.asset(card.getDateiname())),
                              );
                            }),
                      ),
                      Container(
                        width: 100,
                        child: StreamBuilder(
                            stream: streamAblage2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              final card = snapshot.data;
                              if (!snapshot.hasData) {
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
                                child: Container(
                                    child: Image.asset(card.getDateiname())),
                              );
                            }),
                      ),
                      Container(
                        width: 100,
                        child: StreamBuilder(
                            stream: streamAblage3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              final card = snapshot.data;
                              if (!snapshot.hasData) {
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
                                child: Container(
                                    child: Image.asset(card.getDateiname())),
                              );
                            }),
                      ),
                      Container(
                        width: 100,
                        child: StreamBuilder(
                            stream: streamAblage4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              final card = snapshot.data;
                              if (!snapshot.hasData) {
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
                                child: Container(
                                    child: Image.asset(card.getDateiname())),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Deck
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Stapel1
                      StreamBuilder(
                          stream: streamStapel1.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel1[0],
                                            1);
                                        streamAdd(this.oberklasse.kartenStapel1[0]);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel1
                                                  .length ==
                                              1
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel1[0]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel1.length >= 2
                                      ? Positioned(
                                          top: 30,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[1],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[1]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[1]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 3
                                      ? Positioned(
                                          top: 60,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[2],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[2]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[2]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 4
                                      ? Positioned(
                                          top: 90,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[3],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[3]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[3]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 5
                                      ? Positioned(
                                          top: 120,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[4],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[4]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[4]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 6
                                      ? Positioned(
                                          top: 150,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[5],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[5]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[5]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[6],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[6]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[7],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[7]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[8],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[8]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[9],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[9]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[10],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[10]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[11],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[11]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel1.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel1[12],
                                                      1);
                                                  streamAdd(this.oberklasse.kartenStapel1[12]);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel1[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {
                                      this.oberklasse.karteClick(
                                          this.oberklasse.kartenStapel1[0], 1);
                                      streamAdd(this.oberklasse.kartenStapel1[0]);
                                    },
                                    child: this
                                                .oberklasse
                                                .kartenStapel1
                                                .length ==
                                            1
                                        ? Image.asset(this
                                            .oberklasse
                                            .kartenStapel1[0]
                                            .getDateiname())
                                        : Image.asset('playcards/versuch.png'),
                                  ),
                                ),
                                this.oberklasse.kartenStapel1.length >= 2
                                    ? Positioned(
                                        top: 30,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[1],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[1]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[1]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 3
                                    ? Positioned(
                                        top: 60,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[2],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[2]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[2]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 4
                                    ? Positioned(
                                        top: 90,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[3],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[3]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[3]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 5
                                    ? Positioned(
                                        top: 120,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[4],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[4]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[4]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 6
                                    ? Positioned(
                                        top: 150,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[5],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[5]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[5]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[6],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[6]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[7],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[7]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[8],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[8]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[9],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[9]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[10],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[10]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[11],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[11]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel1.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel1[12],
                                                    1);
                                                streamAdd(this.oberklasse.kartenStapel1[12]);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel1[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel2
                      StreamBuilder(
                          stream: streamStapel2.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel2
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel2
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel2[1],
                                              2);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel2
                                                    .length >=
                                                2
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel2[1]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel2.length >= 3
                                      ? Positioned(
                                          top: 60,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[2],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[2]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 4
                                      ? Positioned(
                                          top: 90,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[3],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[3]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 5
                                      ? Positioned(
                                          top: 120,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[4],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[4]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 6
                                      ? Positioned(
                                          top: 150,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[5],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[5]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[6],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[7],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[8],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[9],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[10],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[11],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[12],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel2.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel2[13],
                                                      2);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel2[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel2
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel2
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel2[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel2[1],
                                            2);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel2
                                                  .length >=
                                              2
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel2[1]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel2.length >= 3
                                    ? Positioned(
                                        top: 60,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[2],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[2]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 4
                                    ? Positioned(
                                        top: 90,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[3],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[3]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 5
                                    ? Positioned(
                                        top: 120,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[4],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[4]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 6
                                    ? Positioned(
                                        top: 150,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[5],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[5]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[6],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[7],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[8],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[9],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[10],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[11],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[12],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel2.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel2[13],
                                                    2);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel2[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel3
                      StreamBuilder(
                          stream: streamStapel3.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel3
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel3
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel3
                                                    .length >=
                                                3
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel3
                                                        .length >=
                                                    2
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[1]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel3[2],
                                              3);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel3
                                                    .length >=
                                                3
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel3[2]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel3.length >= 4
                                      ? Positioned(
                                          top: 90,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[3],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[3]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 5
                                      ? Positioned(
                                          top: 120,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[4],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[4]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 6
                                      ? Positioned(
                                          top: 150,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[5],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[5]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[6],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[7],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[8],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[9],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[10],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[11],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[12],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[13],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel3.length >= 15
                                      ? Positioned(
                                          top: 420,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel3[14],
                                                      3);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel3[14]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel3
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel3
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel3[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel3
                                                  .length >=
                                              3
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel3
                                                      .length >=
                                                  2
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[1]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel3[2],
                                            3);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel3
                                                  .length >=
                                              3
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel3[2]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel3.length >= 4
                                    ? Positioned(
                                        top: 90,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[3],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[3]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 5
                                    ? Positioned(
                                        top: 120,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[4],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[4]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 6
                                    ? Positioned(
                                        top: 150,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[5],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[5]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[6],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[7],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[8],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[9],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[10],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[11],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[12],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[13],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel3.length >= 15
                                    ? Positioned(
                                        top: 420,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel3[14],
                                                    3);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel3[14]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel4
                      StreamBuilder(
                          stream: streamStapel4.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel4
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel4
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel4
                                                    .length >=
                                                3
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel4
                                                        .length >=
                                                    2
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[1]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel4
                                                    .length >=
                                                4
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel4
                                                        .length >=
                                                    3
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[2]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel4[3],
                                              4);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel4
                                                    .length >=
                                                4
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel4[3]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel4.length >= 5
                                      ? Positioned(
                                          top: 120,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[4],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[4]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 6
                                      ? Positioned(
                                          top: 150,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[5],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[5]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[6],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[7],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[8],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[9],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[10],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[11],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[12],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[13],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 15
                                      ? Positioned(
                                          top: 420,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[14],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[14]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel4.length >= 16
                                      ? Positioned(
                                          top: 450,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel4[15],
                                                      4);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel4[15]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel4
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel4
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel4[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel4
                                                  .length >=
                                              3
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel4
                                                      .length >=
                                                  2
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[1]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel4
                                                  .length >=
                                              4
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel4
                                                      .length >=
                                                  3
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[2]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel4[3],
                                            4);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel4
                                                  .length >=
                                              4
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel4[3]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel4.length >= 5
                                    ? Positioned(
                                        top: 120,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[4],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[4]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 6
                                    ? Positioned(
                                        top: 150,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[5],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[5]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[6],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[7],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[8],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[9],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[10],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[11],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[12],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[13],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 15
                                    ? Positioned(
                                        top: 420,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[14],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[14]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel4.length >= 16
                                    ? Positioned(
                                        top: 450,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel4[15],
                                                    4);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel4[15]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel5
                      StreamBuilder(
                          stream: streamStapel5.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel5
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel5
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel5
                                                    .length >=
                                                3
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel5
                                                        .length >=
                                                    2
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[1]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel5
                                                    .length >=
                                                4
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel5
                                                        .length >=
                                                    3
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[2]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel5
                                                    .length >=
                                                5
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel5
                                                        .length >=
                                                    4
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[3]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel5[4],
                                              5);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel5
                                                    .length >=
                                                5
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel5[4]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel5.length >= 6
                                      ? Positioned(
                                          top: 150,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[5],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[5]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[6],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[7],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[8],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[9],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[10],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[11],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[12],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[13],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 15
                                      ? Positioned(
                                          top: 420,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[14],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[14]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 16
                                      ? Positioned(
                                          top: 450,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[15],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[15]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel5.length >= 17
                                      ? Positioned(
                                          top: 480,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel5[16],
                                                      5);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel5[16]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel5
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel5
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel5[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel5
                                                  .length >=
                                              3
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel5
                                                      .length >=
                                                  2
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[1]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel5
                                                  .length >=
                                              4
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel5
                                                      .length >=
                                                  3
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[2]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel5
                                                  .length >=
                                              5
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel5
                                                      .length >=
                                                  4
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[3]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel5[4],
                                            5);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel5
                                                  .length >=
                                              5
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel5[4]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel5.length >= 6
                                    ? Positioned(
                                        top: 150,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[5],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[5]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[6],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[7],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[8],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[9],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[10],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[11],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[12],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[13],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 15
                                    ? Positioned(
                                        top: 420,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[14],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[14]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 16
                                    ? Positioned(
                                        top: 450,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[15],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[15]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel5.length >= 17
                                    ? Positioned(
                                        top: 480,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel5[16],
                                                    5);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel5[16]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel6
                      StreamBuilder(
                          stream: streamStapel6.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel6
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                3
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel6
                                                        .length >=
                                                    2
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[1]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                4
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel6
                                                        .length >=
                                                    3
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[2]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                5
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel6
                                                        .length >=
                                                    4
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[3]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                6
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel6
                                                        .length >=
                                                    5
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[4]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel6[5],
                                              6);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                6
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel6[5]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel6.length >= 7
                                      ? Positioned(
                                          top: 180,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[6],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[6]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[7],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 9
                                      ? Positioned(
                                          top: 40,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[8],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[9],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[10],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[11],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[12],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[13],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 15
                                      ? Positioned(
                                          top: 420,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[14],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[14]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 16
                                      ? Positioned(
                                          top: 450,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[15],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[15]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 17
                                      ? Positioned(
                                          top: 480,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[16],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[16]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel6.length >= 18
                                      ? Positioned(
                                          top: 510,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel6[17],
                                                      6);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel6[17]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel6
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel6
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel6[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              3
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel6
                                                      .length >=
                                                  2
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[1]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              4
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel6
                                                      .length >=
                                                  3
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[2]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              5
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel6
                                                      .length >=
                                                  4
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[3]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              6
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel6
                                                      .length >=
                                                  5
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[4]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel6[5],
                                            6);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel6
                                                  .length >=
                                              6
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel6[5]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel6.length >= 7
                                    ? Positioned(
                                        top: 180,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[6],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[6]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[7],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 9
                                    ? Positioned(
                                        top: 40,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[8],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[9],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[10],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[11],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[12],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[13],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 15
                                    ? Positioned(
                                        top: 420,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[14],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[14]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 16
                                    ? Positioned(
                                        top: 450,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[15],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[15]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 17
                                    ? Positioned(
                                        top: 480,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[16],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[16]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel6.length >= 18
                                    ? Positioned(
                                        top: 510,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel6[17],
                                                    6);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel6[17]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                      //Stapel7
                      StreamBuilder(
                          stream: streamStapel7.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            final card = snapshot.data;
                            if (!snapshot.hasData) {
                              return Stack(
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              2
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  1
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[0]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                3
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel7
                                                        .length >=
                                                    2
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[1]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                4
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel7
                                                        .length >=
                                                    3
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[2]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                5
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel7
                                                        .length >=
                                                    4
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[3]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                6
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel7
                                                        .length >=
                                                    5
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[4]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                7
                                            ? Image.asset(
                                                'playcards/ruecken.JPG')
                                            : this
                                                        .oberklasse
                                                        .kartenStapel7
                                                        .length >=
                                                    6
                                                ? Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[5]
                                                    .getDateiname())
                                                : Image.asset(
                                                    'playcards/versuch.png'),
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
                                        onPressed: () {
                                          this.oberklasse.karteClick(
                                              this.oberklasse.kartenStapel7[6],
                                              7);
                                        },
                                        child: this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                7
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel7[6]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
                                      ),
                                    ),
                                  ),
                                  this.oberklasse.kartenStapel7.length >= 8
                                      ? Positioned(
                                          top: 210,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[7],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[7]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 9
                                      ? Positioned(
                                          top: 240,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[8],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[8]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 10
                                      ? Positioned(
                                          top: 270,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[9],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[9]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 11
                                      ? Positioned(
                                          top: 300,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[10],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[10]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 12
                                      ? Positioned(
                                          top: 330,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[11],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[11]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 13
                                      ? Positioned(
                                          top: 360,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[12],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[12]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 14
                                      ? Positioned(
                                          top: 390,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[13],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[13]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 15
                                      ? Positioned(
                                          top: 420,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[14],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[14]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 16
                                      ? Positioned(
                                          top: 450,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[15],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[15]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 17
                                      ? Positioned(
                                          top: 480,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[16],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[16]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 18
                                      ? Positioned(
                                          top: 510,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[17],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[17]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                  this.oberklasse.kartenStapel7.length >= 19
                                      ? Positioned(
                                          top: 540,
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.topCenter,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent),
                                                onPressed: () {
                                                  this.oberklasse.karteClick(
                                                      this
                                                          .oberklasse
                                                          .kartenStapel7[18],
                                                      7);
                                                },
                                                child: Image.asset(this
                                                    .oberklasse
                                                    .kartenStapel7[18]
                                                    .getDateiname())),
                                          ),
                                        )
                                      : Positioned(child: Container()),
                                ],
                              );
                            }
                            return Stack(
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
                                    child: this
                                                .oberklasse
                                                .kartenStapel7
                                                .length >=
                                            2
                                        ? Image.asset('playcards/ruecken.JPG')
                                        : this
                                                    .oberklasse
                                                    .kartenStapel7
                                                    .length >=
                                                1
                                            ? Image.asset(this
                                                .oberklasse
                                                .kartenStapel7[0]
                                                .getDateiname())
                                            : Image.asset(
                                                'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              3
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  2
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[1]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              4
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  3
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[2]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              5
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  4
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[3]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              6
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  5
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[4]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              7
                                          ? Image.asset('playcards/ruecken.JPG')
                                          : this
                                                      .oberklasse
                                                      .kartenStapel7
                                                      .length >=
                                                  6
                                              ? Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[5]
                                                  .getDateiname())
                                              : Image.asset(
                                                  'playcards/versuch.png'),
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
                                      onPressed: () {
                                        this.oberklasse.karteClick(
                                            this.oberklasse.kartenStapel7[6],
                                            7);
                                      },
                                      child: this
                                                  .oberklasse
                                                  .kartenStapel7
                                                  .length >=
                                              7
                                          ? Image.asset(this
                                              .oberklasse
                                              .kartenStapel7[6]
                                              .getDateiname())
                                          : Image.asset(
                                              'playcards/versuch.png'),
                                    ),
                                  ),
                                ),
                                this.oberklasse.kartenStapel7.length >= 8
                                    ? Positioned(
                                        top: 210,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[7],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[7]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 9
                                    ? Positioned(
                                        top: 240,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[8],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[8]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 10
                                    ? Positioned(
                                        top: 270,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[9],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[9]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 11
                                    ? Positioned(
                                        top: 300,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[10],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[10]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 12
                                    ? Positioned(
                                        top: 330,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[11],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[11]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 13
                                    ? Positioned(
                                        top: 360,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[12],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[12]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 14
                                    ? Positioned(
                                        top: 390,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[13],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[13]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 15
                                    ? Positioned(
                                        top: 420,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[14],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[14]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 16
                                    ? Positioned(
                                        top: 450,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[15],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[15]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 17
                                    ? Positioned(
                                        top: 480,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[16],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[16]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 18
                                    ? Positioned(
                                        top: 510,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[17],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[17]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                                this.oberklasse.kartenStapel7.length >= 19
                                    ? Positioned(
                                        top: 540,
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.topCenter,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent),
                                              onPressed: () {
                                                this.oberklasse.karteClick(
                                                    this
                                                        .oberklasse
                                                        .kartenStapel7[18],
                                                    7);
                                              },
                                              child: Image.asset(this
                                                  .oberklasse
                                                  .kartenStapel7[18]
                                                  .getDateiname())),
                                        ),
                                      )
                                    : Positioned(child: Container()),
                              ],
                            );
                          }),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
