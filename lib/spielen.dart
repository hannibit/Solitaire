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

  var empty = new Karte(42, "Herz");

  final streamDraw = StreamController<Karte>();
  final streamAblage1 = StreamController<Karte>();
  final streamAblage2 = StreamController<Karte>();
  final streamAblage3 = StreamController<Karte>();
  final streamAblage4 = StreamController<Karte>();

  final stream1_1 = StreamController<Karte?>.broadcast();
  final stream1_2 = StreamController<Karte?>.broadcast();
  final stream1_3 = StreamController<Karte?>.broadcast();
  final stream1_4 = StreamController<Karte?>.broadcast();
  final stream1_5 = StreamController<Karte?>.broadcast();
  final stream1_6 = StreamController<Karte?>.broadcast();
  final stream1_7 = StreamController<Karte?>.broadcast();
  final stream1_8 = StreamController<Karte?>.broadcast();
  final stream1_9 = StreamController<Karte?>.broadcast();
  final stream1_10 = StreamController<Karte?>.broadcast();
  final stream1_11 = StreamController<Karte?>.broadcast();
  final stream1_12 = StreamController<Karte?>.broadcast();
  final stream1_13 = StreamController<Karte?>.broadcast();

  final stream2_1 = StreamController<Karte?>.broadcast();
  final stream2_2 = StreamController<Karte?>.broadcast();
  final stream2_3 = StreamController<Karte?>.broadcast();
  final stream2_4 = StreamController<Karte?>.broadcast();
  final stream2_5 = StreamController<Karte?>.broadcast();
  final stream2_6 = StreamController<Karte?>.broadcast();
  final stream2_7 = StreamController<Karte?>.broadcast();
  final stream2_8 = StreamController<Karte?>.broadcast();
  final stream2_9 = StreamController<Karte?>.broadcast();
  final stream2_10 = StreamController<Karte?>.broadcast();
  final stream2_11 = StreamController<Karte?>.broadcast();
  final stream2_12 = StreamController<Karte?>.broadcast();
  final stream2_13 = StreamController<Karte?>.broadcast();
  final stream2_14 = StreamController<Karte?>.broadcast();

  final stream3_1 = StreamController<Karte?>.broadcast();
  final stream3_2 = StreamController<Karte?>.broadcast();
  final stream3_3 = StreamController<Karte?>.broadcast();
  final stream3_4 = StreamController<Karte?>.broadcast();
  final stream3_5 = StreamController<Karte?>.broadcast();
  final stream3_6 = StreamController<Karte?>.broadcast();
  final stream3_7 = StreamController<Karte?>.broadcast();
  final stream3_8 = StreamController<Karte?>.broadcast();
  final stream3_9 = StreamController<Karte?>.broadcast();
  final stream3_10 = StreamController<Karte?>.broadcast();
  final stream3_11 = StreamController<Karte?>.broadcast();
  final stream3_12 = StreamController<Karte?>.broadcast();
  final stream3_13 = StreamController<Karte?>.broadcast();
  final stream3_14 = StreamController<Karte?>.broadcast();
  final stream3_15 = StreamController<Karte?>.broadcast();

  final stream4_1 = StreamController<Karte?>.broadcast();
  final stream4_2 = StreamController<Karte?>.broadcast();
  final stream4_3 = StreamController<Karte?>.broadcast();
  final stream4_4 = StreamController<Karte?>.broadcast();
  final stream4_5 = StreamController<Karte?>.broadcast();
  final stream4_6 = StreamController<Karte?>.broadcast();
  final stream4_7 = StreamController<Karte?>.broadcast();
  final stream4_8 = StreamController<Karte?>.broadcast();
  final stream4_9 = StreamController<Karte?>.broadcast();
  final stream4_10 = StreamController<Karte?>.broadcast();
  final stream4_11 = StreamController<Karte?>.broadcast();
  final stream4_12 = StreamController<Karte?>.broadcast();
  final stream4_13 = StreamController<Karte?>.broadcast();
  final stream4_14 = StreamController<Karte?>.broadcast();
  final stream4_15 = StreamController<Karte?>.broadcast();
  final stream4_16 = StreamController<Karte?>.broadcast();

  final stream5_1 = StreamController<Karte?>.broadcast();
  final stream5_2 = StreamController<Karte?>.broadcast();
  final stream5_3 = StreamController<Karte?>.broadcast();
  final stream5_4 = StreamController<Karte?>.broadcast();
  final stream5_5 = StreamController<Karte?>.broadcast();
  final stream5_6 = StreamController<Karte?>.broadcast();
  final stream5_7 = StreamController<Karte?>.broadcast();
  final stream5_8 = StreamController<Karte?>.broadcast();
  final stream5_9 = StreamController<Karte?>.broadcast();
  final stream5_10 = StreamController<Karte?>.broadcast();
  final stream5_11 = StreamController<Karte?>.broadcast();
  final stream5_12 = StreamController<Karte?>.broadcast();
  final stream5_13 = StreamController<Karte?>.broadcast();
  final stream5_14 = StreamController<Karte?>.broadcast();
  final stream5_15 = StreamController<Karte?>.broadcast();
  final stream5_16 = StreamController<Karte?>.broadcast();
  final stream5_17 = StreamController<Karte?>.broadcast();

  final stream6_1 = StreamController<Karte?>.broadcast();
  final stream6_2 = StreamController<Karte?>.broadcast();
  final stream6_3 = StreamController<Karte?>.broadcast();
  final stream6_4 = StreamController<Karte?>.broadcast();
  final stream6_5 = StreamController<Karte?>.broadcast();
  final stream6_6 = StreamController<Karte?>.broadcast();
  final stream6_7 = StreamController<Karte?>.broadcast();
  final stream6_8 = StreamController<Karte?>.broadcast();
  final stream6_9 = StreamController<Karte?>.broadcast();
  final stream6_10 = StreamController<Karte?>.broadcast();
  final stream6_11 = StreamController<Karte?>.broadcast();
  final stream6_12 = StreamController<Karte?>.broadcast();
  final stream6_13 = StreamController<Karte?>.broadcast();
  final stream6_14 = StreamController<Karte?>.broadcast();
  final stream6_15 = StreamController<Karte?>.broadcast();
  final stream6_16 = StreamController<Karte?>.broadcast();
  final stream6_17 = StreamController<Karte?>.broadcast();
  final stream6_18 = StreamController<Karte?>.broadcast();

  final stream7_1 = StreamController<Karte?>.broadcast();
  final stream7_2 = StreamController<Karte?>.broadcast();
  final stream7_3 = StreamController<Karte?>.broadcast();
  final stream7_4 = StreamController<Karte?>.broadcast();
  final stream7_5 = StreamController<Karte?>.broadcast();
  final stream7_6 = StreamController<Karte?>.broadcast();
  final stream7_7 = StreamController<Karte?>.broadcast();
  final stream7_8 = StreamController<Karte?>.broadcast();
  final stream7_9 = StreamController<Karte?>.broadcast();
  final stream7_10 = StreamController<Karte?>.broadcast();
  final stream7_11 = StreamController<Karte?>.broadcast();
  final stream7_12 = StreamController<Karte?>.broadcast();
  final stream7_13 = StreamController<Karte?>.broadcast();
  final stream7_14 = StreamController<Karte?>.broadcast();
  final stream7_15 = StreamController<Karte?>.broadcast();
  final stream7_16 = StreamController<Karte?>.broadcast();
  final stream7_17 = StreamController<Karte?>.broadcast();
  final stream7_18 = StreamController<Karte?>.broadcast();
  final stream7_19 = StreamController<Karte?>.broadcast();

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => {},
    onChangeRawSecond: (value) => {},
    onChangeRawMinute: (value) => {},
  );

  void updateStream1(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel1; i < 13; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel1.length >= 1? stream1_1.add(this.oberklasse.kartenStapel1[i]) : stream1_1.add(null); break;
        case 1: this.oberklasse.kartenStapel1.length >= 2? stream1_2.add(this.oberklasse.kartenStapel1[i]) : stream1_2.add(null); break;
        case 2: this.oberklasse.kartenStapel1.length >= 3? stream1_3.add(this.oberklasse.kartenStapel1[i]) : stream1_3.add(null); break;
        case 3: this.oberklasse.kartenStapel1.length >= 4? stream1_4.add(this.oberklasse.kartenStapel1[i]) : stream1_4.add(null); break;
        case 4: this.oberklasse.kartenStapel1.length >= 5? stream1_5.add(this.oberklasse.kartenStapel1[i]) : stream1_5.add(null); break;
        case 5: this.oberklasse.kartenStapel1.length >= 6? stream1_6.add(this.oberklasse.kartenStapel1[i]) : stream1_6.add(null); break;
        case 6: this.oberklasse.kartenStapel1.length >= 7? stream1_7.add(this.oberklasse.kartenStapel1[i]) : stream1_7.add(null); break;
        case 7: this.oberklasse.kartenStapel1.length >= 8? stream1_8.add(this.oberklasse.kartenStapel1[i]) : stream1_8.add(null); break;
        case 8: this.oberklasse.kartenStapel1.length >= 9? stream1_9.add(this.oberklasse.kartenStapel1[i]) : stream1_9.add(null); break;
        case 9: this.oberklasse.kartenStapel1.length >= 10? stream1_10.add(this.oberklasse.kartenStapel1[i]) : stream1_10.add(null); break;
        case 10: this.oberklasse.kartenStapel1.length >= 11? stream1_11.add(this.oberklasse.kartenStapel1[i]) : stream1_11.add(null); break;
        case 11: this.oberklasse.kartenStapel1.length >= 12? stream1_12.add(this.oberklasse.kartenStapel1[i]) : stream1_12.add(null); break;
        case 12: this.oberklasse.kartenStapel1.length >= 13? stream1_13.add(this.oberklasse.kartenStapel1[i]) : stream1_13.add(null); break;
      }
    }
  }

  void updateStream2(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel2; i < 14; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel2.length >= 1? stream2_1.add(this.oberklasse.kartenStapel2[i]) : stream2_1.add(null); break;
        case 1: this.oberklasse.kartenStapel2.length >= 2? stream2_2.add(this.oberklasse.kartenStapel2[i]) : stream2_2.add(null); break;
        case 2: this.oberklasse.kartenStapel2.length >= 3? stream2_3.add(this.oberklasse.kartenStapel2[i]) : stream2_3.add(null); break;
        case 3: this.oberklasse.kartenStapel2.length >= 4? stream2_4.add(this.oberklasse.kartenStapel2[i]) : stream2_4.add(null); break;
        case 4: this.oberklasse.kartenStapel2.length >= 5? stream2_5.add(this.oberklasse.kartenStapel2[i]) : stream2_5.add(null); break;
        case 5: this.oberklasse.kartenStapel2.length >= 6? stream2_6.add(this.oberklasse.kartenStapel2[i]) : stream2_6.add(null); break;
        case 6: this.oberklasse.kartenStapel2.length >= 7? stream2_7.add(this.oberklasse.kartenStapel2[i]) : stream2_7.add(null); break;
        case 7: this.oberklasse.kartenStapel2.length >= 8? stream2_8.add(this.oberklasse.kartenStapel2[i]) : stream2_8.add(null); break;
        case 8: this.oberklasse.kartenStapel2.length >= 9? stream2_9.add(this.oberklasse.kartenStapel2[i]) : stream2_9.add(null); break;
        case 9: this.oberklasse.kartenStapel2.length >= 10? stream2_10.add(this.oberklasse.kartenStapel2[i]) : stream2_10.add(null); break;
        case 10: this.oberklasse.kartenStapel2.length >= 11? stream2_11.add(this.oberklasse.kartenStapel2[i]) : stream2_11.add(null); break;
        case 11: this.oberklasse.kartenStapel2.length >= 12? stream2_12.add(this.oberklasse.kartenStapel2[i]) : stream2_12.add(null); break;
        case 12: this.oberklasse.kartenStapel2.length >= 13? stream2_13.add(this.oberklasse.kartenStapel2[i]) : stream2_13.add(null); break;
        case 13: this.oberklasse.kartenStapel2.length >= 14? stream2_14.add(this.oberklasse.kartenStapel2[i]) : stream2_14.add(null); break;
      }
    }
  }

  void updateStream3(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel3; i < 15; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel3.length >= 1? stream3_1.add(this.oberklasse.kartenStapel3[i]) : stream3_1.add(null); break;
        case 1: this.oberklasse.kartenStapel3.length >= 2? stream3_2.add(this.oberklasse.kartenStapel3[i]) : stream3_2.add(null); break;
        case 2: this.oberklasse.kartenStapel3.length >= 3? stream3_3.add(this.oberklasse.kartenStapel3[i]) : stream3_3.add(null); break;
        case 3: this.oberklasse.kartenStapel3.length >= 4? stream3_4.add(this.oberklasse.kartenStapel3[i]) : stream3_4.add(null); break;
        case 4: this.oberklasse.kartenStapel3.length >= 5? stream3_5.add(this.oberklasse.kartenStapel3[i]) : stream3_5.add(null); break;
        case 5: this.oberklasse.kartenStapel3.length >= 6? stream3_6.add(this.oberklasse.kartenStapel3[i]) : stream3_6.add(null); break;
        case 6: this.oberklasse.kartenStapel3.length >= 7? stream3_7.add(this.oberklasse.kartenStapel3[i]) : stream3_7.add(null); break;
        case 7: this.oberklasse.kartenStapel3.length >= 8? stream3_8.add(this.oberklasse.kartenStapel3[i]) : stream3_8.add(null); break;
        case 8: this.oberklasse.kartenStapel3.length >= 9? stream3_9.add(this.oberklasse.kartenStapel3[i]) : stream3_9.add(null); break;
        case 9: this.oberklasse.kartenStapel3.length >= 10? stream3_10.add(this.oberklasse.kartenStapel3[i]) : stream3_10.add(null); break;
        case 10: this.oberklasse.kartenStapel3.length >= 11? stream3_11.add(this.oberklasse.kartenStapel3[i]) : stream3_11.add(null); break;
        case 11: this.oberklasse.kartenStapel3.length >= 12? stream3_12.add(this.oberklasse.kartenStapel3[i]) : stream3_12.add(null); break;
        case 12: this.oberklasse.kartenStapel3.length >= 13? stream3_13.add(this.oberklasse.kartenStapel3[i]) : stream3_13.add(null); break;
        case 13: this.oberklasse.kartenStapel3.length >= 14? stream3_14.add(this.oberklasse.kartenStapel3[i]) : stream3_14.add(null); break;
        case 14: this.oberklasse.kartenStapel3.length >= 15? stream3_15.add(this.oberklasse.kartenStapel3[i]) : stream3_15.add(null); break;
      }
    }
  }

  void updateStream4(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel4; i < 16; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel4.length >= 1? stream4_1.add(this.oberklasse.kartenStapel4[i]) : stream4_1.add(null); break;
        case 1: this.oberklasse.kartenStapel4.length >= 2? stream4_2.add(this.oberklasse.kartenStapel4[i]) : stream4_2.add(null); break;
        case 2: this.oberklasse.kartenStapel4.length >= 3? stream4_3.add(this.oberklasse.kartenStapel4[i]) : stream4_3.add(null); break;
        case 3: this.oberklasse.kartenStapel4.length >= 4? stream4_4.add(this.oberklasse.kartenStapel4[i]) : stream4_4.add(null); break;
        case 4: this.oberklasse.kartenStapel4.length >= 5? stream4_5.add(this.oberklasse.kartenStapel4[i]) : stream4_5.add(null); break;
        case 5: this.oberklasse.kartenStapel4.length >= 6? stream4_6.add(this.oberklasse.kartenStapel4[i]) : stream4_6.add(null); break;
        case 6: this.oberklasse.kartenStapel4.length >= 7? stream4_7.add(this.oberklasse.kartenStapel4[i]) : stream4_7.add(null); break;
        case 7: this.oberklasse.kartenStapel4.length >= 8? stream4_8.add(this.oberklasse.kartenStapel4[i]) : stream4_8.add(null); break;
        case 8: this.oberklasse.kartenStapel4.length >= 9? stream4_9.add(this.oberklasse.kartenStapel4[i]) : stream4_9.add(null); break;
        case 9: this.oberklasse.kartenStapel4.length >= 10? stream4_10.add(this.oberklasse.kartenStapel4[i]) : stream4_10.add(null); break;
        case 10: this.oberklasse.kartenStapel4.length >= 11? stream4_11.add(this.oberklasse.kartenStapel4[i]) : stream4_11.add(null); break;
        case 11: this.oberklasse.kartenStapel4.length >= 12? stream4_12.add(this.oberklasse.kartenStapel4[i]) : stream4_12.add(null); break;
        case 12: this.oberklasse.kartenStapel4.length >= 13? stream4_13.add(this.oberklasse.kartenStapel4[i]) : stream4_13.add(null); break;
        case 13: this.oberklasse.kartenStapel4.length >= 14? stream4_14.add(this.oberklasse.kartenStapel4[i]) : stream4_14.add(null); break;
        case 14: this.oberklasse.kartenStapel4.length >= 15? stream4_15.add(this.oberklasse.kartenStapel4[i]) : stream4_15.add(null); break;
        case 15: this.oberklasse.kartenStapel4.length >= 16? stream4_16.add(this.oberklasse.kartenStapel4[i]) : stream4_16.add(null); break;
      }
    }
  }

  void updateStream5(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel5; i < 17; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel5.length >= 1? stream5_1.add(this.oberklasse.kartenStapel5[i]) : stream5_1.add(null); break;
        case 1: this.oberklasse.kartenStapel5.length >= 2? stream5_2.add(this.oberklasse.kartenStapel5[i]) : stream5_2.add(null); break;
        case 2: this.oberklasse.kartenStapel5.length >= 3? stream5_3.add(this.oberklasse.kartenStapel5[i]) : stream5_3.add(null); break;
        case 3: this.oberklasse.kartenStapel5.length >= 4? stream5_4.add(this.oberklasse.kartenStapel5[i]) : stream5_4.add(null); break;
        case 4: this.oberklasse.kartenStapel5.length >= 5? stream5_5.add(this.oberklasse.kartenStapel5[i]) : stream5_5.add(null); break;
        case 5: this.oberklasse.kartenStapel5.length >= 6? stream5_6.add(this.oberklasse.kartenStapel5[i]) : stream5_6.add(null); break;
        case 6: this.oberklasse.kartenStapel5.length >= 7? stream5_7.add(this.oberklasse.kartenStapel5[i]) : stream5_7.add(null); break;
        case 7: this.oberklasse.kartenStapel5.length >= 8? stream5_8.add(this.oberklasse.kartenStapel5[i]) : stream5_8.add(null); break;
        case 8: this.oberklasse.kartenStapel5.length >= 9? stream5_9.add(this.oberklasse.kartenStapel5[i]) : stream5_9.add(null); break;
        case 9: this.oberklasse.kartenStapel5.length >= 10? stream5_10.add(this.oberklasse.kartenStapel5[i]) : stream5_10.add(null); break;
        case 10: this.oberklasse.kartenStapel5.length >= 11? stream5_11.add(this.oberklasse.kartenStapel5[i]) : stream5_11.add(null); break;
        case 11: this.oberklasse.kartenStapel5.length >= 12? stream5_12.add(this.oberklasse.kartenStapel5[i]) : stream5_12.add(null); break;
        case 12: this.oberklasse.kartenStapel5.length >= 13? stream5_13.add(this.oberklasse.kartenStapel5[i]) : stream5_13.add(null); break;
        case 13: this.oberklasse.kartenStapel5.length >= 14? stream5_14.add(this.oberklasse.kartenStapel5[i]) : stream5_14.add(null); break;
        case 14: this.oberklasse.kartenStapel5.length >= 15? stream5_15.add(this.oberklasse.kartenStapel5[i]) : stream5_15.add(null); break;
        case 15: this.oberklasse.kartenStapel5.length >= 16? stream5_16.add(this.oberklasse.kartenStapel5[i]) : stream5_16.add(null); break;
        case 16: this.oberklasse.kartenStapel5.length >= 17? stream5_17.add(this.oberklasse.kartenStapel5[i]) : stream5_17.add(null); break;
      }
    }
  }

  void updateStream6(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel6; i < 18; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel6.length >= 1? stream6_1.add(this.oberklasse.kartenStapel6[i]) : stream6_1.add(null); break;
        case 1: this.oberklasse.kartenStapel6.length >= 2? stream6_2.add(this.oberklasse.kartenStapel6[i]) : stream6_2.add(null); break;
        case 2: this.oberklasse.kartenStapel6.length >= 3? stream6_3.add(this.oberklasse.kartenStapel6[i]) : stream6_3.add(null); break;
        case 3: this.oberklasse.kartenStapel6.length >= 4? stream6_4.add(this.oberklasse.kartenStapel6[i]) : stream6_4.add(null); break;
        case 4: this.oberklasse.kartenStapel6.length >= 5? stream6_5.add(this.oberklasse.kartenStapel6[i]) : stream6_5.add(null); break;
        case 5: this.oberklasse.kartenStapel6.length >= 6? stream6_6.add(this.oberklasse.kartenStapel6[i]) : stream6_6.add(null); break;
        case 6: this.oberklasse.kartenStapel6.length >= 7? stream6_7.add(this.oberklasse.kartenStapel6[i]) : stream6_7.add(null); break;
        case 7: this.oberklasse.kartenStapel6.length >= 8? stream6_8.add(this.oberklasse.kartenStapel6[i]) : stream6_8.add(null); break;
        case 8: this.oberklasse.kartenStapel6.length >= 9? stream6_9.add(this.oberklasse.kartenStapel6[i]) : stream6_9.add(null); break;
        case 9: this.oberklasse.kartenStapel6.length >= 10? stream6_10.add(this.oberklasse.kartenStapel6[i]) : stream6_10.add(null); break;
        case 10: this.oberklasse.kartenStapel6.length >= 11? stream6_11.add(this.oberklasse.kartenStapel6[i]) : stream6_11.add(null); break;
        case 11: this.oberklasse.kartenStapel6.length >= 12? stream6_12.add(this.oberklasse.kartenStapel6[i]) : stream6_12.add(null); break;
        case 12: this.oberklasse.kartenStapel6.length >= 13? stream6_13.add(this.oberklasse.kartenStapel6[i]) : stream6_13.add(null); break;
        case 13: this.oberklasse.kartenStapel6.length >= 14? stream6_14.add(this.oberklasse.kartenStapel6[i]) : stream6_14.add(null); break;
        case 14: this.oberklasse.kartenStapel6.length >= 15? stream6_15.add(this.oberklasse.kartenStapel6[i]) : stream6_15.add(null); break;
        case 15: this.oberklasse.kartenStapel6.length >= 16? stream6_16.add(this.oberklasse.kartenStapel6[i]) : stream6_16.add(null); break;
        case 16: this.oberklasse.kartenStapel6.length >= 17? stream6_17.add(this.oberklasse.kartenStapel6[i]) : stream6_17.add(null); break;
        case 17: this.oberklasse.kartenStapel6.length >= 18? stream6_18.add(this.oberklasse.kartenStapel6[i]) : stream6_18.add(null); break;
      }
    }
  }

  void updateStream7(Karte karte) {
    for(var i = this.oberklasse.rueckenStapel7; i < 19; i++) {
      switch(i) {
        case 0: this.oberklasse.kartenStapel7.length >= 1? stream7_1.add(this.oberklasse.kartenStapel7[i]) : stream7_1.add(null); break;
        case 1: this.oberklasse.kartenStapel7.length >= 2? stream7_2.add(this.oberklasse.kartenStapel7[i]) : stream7_2.add(null); break;
        case 2: this.oberklasse.kartenStapel7.length >= 3? stream7_3.add(this.oberklasse.kartenStapel7[i]) : stream7_3.add(null); break;
        case 3: this.oberklasse.kartenStapel7.length >= 4? stream7_4.add(this.oberklasse.kartenStapel7[i]) : stream7_4.add(null); break;
        case 4: this.oberklasse.kartenStapel7.length >= 5? stream7_5.add(this.oberklasse.kartenStapel7[i]) : stream7_5.add(null); break;
        case 5: this.oberklasse.kartenStapel7.length >= 6? stream7_6.add(this.oberklasse.kartenStapel7[i]) : stream7_6.add(null); break;
        case 6: this.oberklasse.kartenStapel7.length >= 7? stream7_7.add(this.oberklasse.kartenStapel7[i]) : stream7_7.add(null); break;
        case 7: this.oberklasse.kartenStapel7.length >= 8? stream7_8.add(this.oberklasse.kartenStapel7[i]) : stream7_8.add(null); break;
        case 8: this.oberklasse.kartenStapel7.length >= 9? stream7_9.add(this.oberklasse.kartenStapel7[i]) : stream7_9.add(null); break;
        case 9: this.oberklasse.kartenStapel7.length >= 10? stream7_10.add(this.oberklasse.kartenStapel7[i]) : stream7_10.add(null); break;
        case 10: this.oberklasse.kartenStapel7.length >= 11? stream7_11.add(this.oberklasse.kartenStapel7[i]) : stream7_11.add(null); break;
        case 11: this.oberklasse.kartenStapel7.length >= 12? stream7_12.add(this.oberklasse.kartenStapel7[i]) : stream7_12.add(null); break;
        case 12: this.oberklasse.kartenStapel7.length >= 13? stream7_13.add(this.oberklasse.kartenStapel7[i]) : stream7_13.add(null); break;
        case 13: this.oberklasse.kartenStapel7.length >= 14? stream7_14.add(this.oberklasse.kartenStapel7[i]) : stream7_14.add(null); break;
        case 14: this.oberklasse.kartenStapel7.length >= 15? stream7_15.add(this.oberklasse.kartenStapel7[i]) : stream7_15.add(null); break;
        case 15: this.oberklasse.kartenStapel7.length >= 16? stream7_16.add(this.oberklasse.kartenStapel7[i]) : stream7_16.add(null); break;
        case 16: this.oberklasse.kartenStapel7.length >= 17? stream7_17.add(this.oberklasse.kartenStapel7[i]) : stream7_17.add(null); break;
        case 17: this.oberklasse.kartenStapel7.length >= 18? stream7_18.add(this.oberklasse.kartenStapel7[i]) : stream7_18.add(null); break;
        case 18: this.oberklasse.kartenStapel7.length >= 19? stream7_19.add(this.oberklasse.kartenStapel7[i]) : stream7_19.add(null); break;
      }
    }
  }

  void updateHerkunft(Karte karte, stapel) {
    checkLength(stapel);
    switch(stapel) {
      case 1: updateStream1(karte); break;
      case 2: updateStream2(karte); break;
      case 3: updateStream3(karte); break;
      case 4: updateStream4(karte); break;
      case 5: updateStream5(karte); break;
      case 6: updateStream6(karte); break;
      case 7: updateStream7(karte); break;
    }
  }

  void checkLength(stapel) {
    switch(stapel) {
      case 1:
        if (this.oberklasse.kartenStapel1.length == this.oberklasse.rueckenStapel1) {
          if (this.oberklasse.rueckenStapel1 != 0) {
            this.oberklasse.rueckenStapel1 = this.oberklasse.rueckenStapel1 - 1;
          }
        }
        return;
      case 2:
        if (this.oberklasse.kartenStapel2.length == this.oberklasse.rueckenStapel2) {
          if (this.oberklasse.rueckenStapel2 != 0) {
            this.oberklasse.rueckenStapel2 = this.oberklasse.rueckenStapel2 - 1;
          }
        }
        return;
      case 3:
        if (this.oberklasse.kartenStapel3.length == this.oberklasse.rueckenStapel3) {
          if (this.oberklasse.rueckenStapel3 != 0) {
            this.oberklasse.rueckenStapel3 = this.oberklasse.rueckenStapel3 - 1;
          }
        }
        return;
      case 4:
        if (this.oberklasse.kartenStapel4.length == this.oberklasse.rueckenStapel4) {
          if (this.oberklasse.rueckenStapel4 != 0) {
            this.oberklasse.rueckenStapel4 = this.oberklasse.rueckenStapel4 - 1;
          }
        }
        return;
      case 5:
        if (this.oberklasse.kartenStapel5.length == this.oberklasse.rueckenStapel5) {
          if (this.oberklasse.rueckenStapel5 != 0) {
            this.oberklasse.rueckenStapel5 = this.oberklasse.rueckenStapel5 - 1;
          }
        }
        return;
      case 6:
        if (this.oberklasse.kartenStapel6.length == this.oberklasse.rueckenStapel6) {
          if (this.oberklasse.rueckenStapel6 != 0) {
            this.oberklasse.rueckenStapel6 = this.oberklasse.rueckenStapel6 - 1;
          }
        }
        return;
      case 7:
        if (this.oberklasse.kartenStapel7.length == this.oberklasse.rueckenStapel7) {
          if (this.oberklasse.rueckenStapel7 != 0) {
            this.oberklasse.rueckenStapel7 = this.oberklasse.rueckenStapel7 - 1;
          }
        }
        return;
    }
  }

  void streamAdd(Karte karte, stapel) {
    if (this.oberklasse.karteClick(karte, stapel)) {
      final ort = this.oberklasse.ort[0];
      final index = this.oberklasse.index[0];
      switch (ort) {
        case 'Ablage':
          switch (index) {
            case 1:
              streamAblage1.add(karte);
              updateHerkunft(karte, stapel);
              return;
            case 2:
              streamAblage2.add(karte);
              updateHerkunft(karte, stapel);
              return;
            case 3:
              streamAblage3.add(karte);
              updateHerkunft(karte, stapel);
              return;
            case 4:
              streamAblage4.add(karte);
              updateHerkunft(karte, stapel);
              return;
          }
          return;
        case 'Stapel':
          switch (index) {
            case 1:
              updateStream1(karte);
              updateHerkunft(karte, stapel);
              return;
            case 2:
              updateStream2(karte);
              updateHerkunft(karte, stapel);
              return;
            case 3:
              updateStream3(karte);
              updateHerkunft(karte, stapel);
              return;
            case 4:
              updateStream4(karte);
              updateHerkunft(karte, stapel);
              return;
            case 5:
              updateStream5(karte);
              updateHerkunft(karte, stapel);
              return;
            case 6:
              updateStream6(karte);
              updateHerkunft(karte, stapel);
              return;
            case 7:
              updateStream7(karte);
              updateHerkunft(karte, stapel);
              return;
          }
          return;
      }
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

    stream1_1.close();
    stream1_2.close();
    stream1_3.close();
    stream1_4.close();
    stream1_5.close();
    stream1_6.close();
    stream1_7.close();
    stream1_8.close();
    stream1_9.close();
    stream1_10.close();
    stream1_11.close();
    stream1_12.close();
    stream1_13.close();

    stream2_1.close();
    stream2_2.close();
    stream2_3.close();
    stream2_4.close();
    stream2_5.close();
    stream2_6.close();
    stream2_7.close();
    stream2_8.close();
    stream2_9.close();
    stream2_10.close();
    stream2_11.close();
    stream2_12.close();
    stream2_13.close();
    stream2_14.close();

    stream3_1.close();
    stream3_2.close();
    stream3_3.close();
    stream3_4.close();
    stream3_5.close();
    stream3_6.close();
    stream3_7.close();
    stream3_8.close();
    stream3_9.close();
    stream3_10.close();
    stream3_11.close();
    stream3_12.close();
    stream3_13.close();
    stream3_14.close();
    stream3_15.close();

    stream4_1.close();
    stream4_2.close();
    stream4_3.close();
    stream4_4.close();
    stream4_5.close();
    stream4_6.close();
    stream4_7.close();
    stream4_8.close();
    stream4_9.close();
    stream4_10.close();
    stream4_11.close();
    stream4_12.close();
    stream4_13.close();
    stream4_14.close();
    stream4_15.close();
    stream4_16.close();

    stream5_1.close();
    stream5_2.close();
    stream5_3.close();
    stream5_4.close();
    stream5_5.close();
    stream5_6.close();
    stream5_7.close();
    stream5_8.close();
    stream5_9.close();
    stream5_10.close();
    stream5_11.close();
    stream5_12.close();
    stream5_13.close();
    stream5_14.close();
    stream5_15.close();
    stream5_16.close();
    stream5_17.close();

    stream6_1.close();
    stream6_2.close();
    stream6_3.close();
    stream6_4.close();
    stream6_5.close();
    stream6_6.close();
    stream6_7.close();
    stream6_8.close();
    stream6_9.close();
    stream6_10.close();
    stream6_11.close();
    stream6_12.close();
    stream6_13.close();
    stream6_14.close();
    stream6_15.close();
    stream6_16.close();
    stream6_17.close();
    stream6_18.close();

    stream7_1.close();
    stream7_2.close();
    stream7_3.close();
    stream7_4.close();
    stream7_5.close();
    stream7_6.close();
    stream7_7.close();
    stream7_8.close();
    stream7_9.close();
    stream7_10.close();
    stream7_11.close();
    stream7_12.close();
    stream7_13.close();
    stream7_14.close();
    stream7_15.close();
    stream7_16.close();
    stream7_17.close();
    stream7_18.close();
    stream7_19.close();
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
                                    streamAdd(this.oberklasse.anzeigeKarte[0], 0);
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
                                return Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)
                                    ),
                                  child: Image.asset('playcards/versuch.png'),
                                );
                              }
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {
                                  //TODO: Karten von der Ablage nehmen
                                },
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
                                return Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.asset('playcards/versuch.png'),
                                );
                              }
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {

                                },
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
                                return Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.asset('playcards/versuch.png'),
                                );
                              }
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {

                                },
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
                                return Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.asset('playcards/versuch.png'),
                                );
                              }
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () {

                                },
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
                      Stack(
                        alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream1_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[0], 1);},
                                    child: this.oberklasse.kartenStapel1.length >= 1 ?
                                    Image.asset(this.oberklasse.kartenStapel1[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                  ),
                                );
                              }
                              return this.oberklasse.kartenStapel1.length >= 1?
                              this.oberklasse.rueckenStapel1 <= 0?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {streamAdd(this.oberklasse.kartenStapel1[0], 1);},
                                  child: Image.asset(this.oberklasse.kartenStapel1[0].getDateiname())
                              ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream1_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[1], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel1[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel1.length >= 2?
                                this.oberklasse.rueckenStapel1 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[1], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[2], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel1[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel1.length >= 3?
                                this.oberklasse.rueckenStapel1 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[2], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[3], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel1[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel1.length >= 4?
                                this.oberklasse.rueckenStapel1 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[3], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[4], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel1[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel1.length >= 5?
                                this.oberklasse.rueckenStapel1 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[4], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[5], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel1[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel1.length >= 6?
                                this.oberklasse.rueckenStapel1 <= 5?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[5], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[5].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel1[6], 1);},
                                      child: this.oberklasse.kartenStapel1.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel1[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                child: this.oberklasse.kartenStapel1.length >= 7?
                                this.oberklasse.rueckenStapel1 <= 6?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[6], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[6].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 8
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[7], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[7].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel1.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[7], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 9
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[8], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[8].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel1.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[8], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 10
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[9], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[9].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel1.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[9], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 11
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[10], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[10].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel1.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[10], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 12
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[11], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[11].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel1.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[11], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream1_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel1.length >= 13
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel1[12], 1);},
                                        child: Image.asset(this.oberklasse.kartenStapel1[12].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel1.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel1[12], 1);},
                                    child: Image.asset(this.oberklasse.kartenStapel1[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        ],
                      ),
                      //Stapel2
                      Stack(
                        alignment: Alignment.topCenter, children: [
                          StreamBuilder(
                              stream: stream2_1.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[0], 2);},
                                      child: this.oberklasse.kartenStapel2.length >= 1 ?
                                      Image.asset(this.oberklasse.kartenStapel2[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  );
                                }
                                return this.oberklasse.kartenStapel2.length >= 1?
                                this.oberklasse.rueckenStapel2 <= 0?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel2[0], 2);},
                                    child: Image.asset(this.oberklasse.kartenStapel2[0].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                              }),
                          StreamBuilder(
                              stream: stream2_2.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 30,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[1], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 2 ?
                                        Image.asset(this.oberklasse.kartenStapel2[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 30,
                                  child: this.oberklasse.kartenStapel2.length >= 2?
                                  this.oberklasse.rueckenStapel2 <= 1?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[1], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[1].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_3.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 60,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[2], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 3 ?
                                        Image.asset(this.oberklasse.kartenStapel2[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 60,
                                  child: this.oberklasse.kartenStapel2.length >= 3?
                                  this.oberklasse.rueckenStapel2 <= 2?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[2], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[2].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_4.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 90,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[3], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 4 ?
                                        Image.asset(this.oberklasse.kartenStapel2[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 90,
                                  child: this.oberklasse.kartenStapel2.length >= 4?
                                  this.oberklasse.rueckenStapel2 <= 3?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[3], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[3].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_5.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 120,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[4], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 5 ?
                                        Image.asset(this.oberklasse.kartenStapel2[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 120,
                                  child: this.oberklasse.kartenStapel2.length >= 5?
                                  this.oberklasse.rueckenStapel2 <= 4?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[4], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[4].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_6.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 150,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[5], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 6 ?
                                        Image.asset(this.oberklasse.kartenStapel2[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 150,
                                  child: this.oberklasse.kartenStapel2.length >= 6?
                                  this.oberklasse.rueckenStapel2 <= 5?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[5], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[5].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_7.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData && snapshot.data != null) {
                                  return Positioned(
                                    top: 180,
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel2[6], 2);},
                                        child: this.oberklasse.kartenStapel2.length >= 7 ?
                                        Image.asset(this.oberklasse.kartenStapel2[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                      ),
                                    ),
                                  );
                                }
                                return Positioned(
                                  top: 180,
                                  child: this.oberklasse.kartenStapel2.length >= 7?
                                  this.oberklasse.rueckenStapel2 <= 6?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[6], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[6].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_8.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 8
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[7], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[7].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 210,
                                  child: this.oberklasse.kartenStapel2.length >= 8?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[7], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[7].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_9.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 9
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[8], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[8].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 240,
                                  child: this.oberklasse.kartenStapel2.length >= 9?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[8], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[8].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_10.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 10
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[9], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[9].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 270,
                                  child: this.oberklasse.kartenStapel2.length >= 10?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[9], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[9].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_11.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 11
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[10], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[10].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 300,
                                  child: this.oberklasse.kartenStapel2.length >= 11?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[10], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[10].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_12.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 12
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[11], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[11].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 330,
                                  child: this.oberklasse.kartenStapel2.length >= 12?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[11], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[11].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_13.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 13
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[12], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[12].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 360,
                                  child: this.oberklasse.kartenStapel2.length >= 13?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[12], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[12].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                          StreamBuilder(
                              stream: stream2_14.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return this.oberklasse.kartenStapel2.length >= 14
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
                                          onPressed: () {streamAdd(this.oberklasse.kartenStapel2[13], 2);},
                                          child: Image.asset(this.oberklasse.kartenStapel2[13].getDateiname())),
                                    ),
                                  ) : Positioned(child: Container());
                                }
                                return Positioned(
                                  top: 390,
                                  child: this.oberklasse.kartenStapel2.length >= 14?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel2[13], 2);},
                                      child: Image.asset(this.oberklasse.kartenStapel2[13].getDateiname())
                                  ) : Image.asset('playcards/versuch.png'),
                                );
                              }),
                        ],
                      ),
                      //Stapel3
                      Stack(alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream3_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[0], 3);},
                                    child: this.oberklasse.kartenStapel3.length >= 1 ?
                                    Image.asset(this.oberklasse.kartenStapel3[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                  ),
                                );
                              }
                              return this.oberklasse.kartenStapel3.length >= 1?
                              this.oberklasse.rueckenStapel3 <= 0?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {streamAdd(this.oberklasse.kartenStapel3[0], 3);},
                                  child: Image.asset(this.oberklasse.kartenStapel3[0].getDateiname())
                              ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream3_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[1], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel3[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel3.length >= 2?
                                this.oberklasse.rueckenStapel3 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[1], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[2], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel3[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel3.length >= 3?
                                this.oberklasse.rueckenStapel3 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[2], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[3], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel3[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel3.length >= 4?
                                this.oberklasse.rueckenStapel3 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[3], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[4], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel3[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel3.length >= 5?
                                this.oberklasse.rueckenStapel3 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[4], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[5], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel3[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel3.length >= 6?
                                this.oberklasse.rueckenStapel3 <= 5?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[5], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[5].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel3[6], 3);},
                                      child: this.oberklasse.kartenStapel3.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel3[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                child: this.oberklasse.kartenStapel3.length >= 7?
                                this.oberklasse.rueckenStapel3 <= 6?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[6], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[6].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 8
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[7], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[7].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel3.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[7], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 9
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[8], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[8].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel3.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[8], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 10
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[9], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[9].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel3.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[9], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 11
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[10], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[10].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel3.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[10], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 12
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[11], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[11].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel3.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[11], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 13
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[12], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[12].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel3.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[12], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_14.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 14
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[13], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[13].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 390,
                                child: this.oberklasse.kartenStapel3.length >= 14?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[13], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[13].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream3_15.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel3.length >= 15
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel3[14], 3);},
                                        child: Image.asset(this.oberklasse.kartenStapel3[14].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 420,
                                child: this.oberklasse.kartenStapel3.length >= 15?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel3[14], 3);},
                                    child: Image.asset(this.oberklasse.kartenStapel3[14].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                      ]),
                      //Stapel4
                      Stack(alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream4_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[0], 4);},
                                    child: this.oberklasse.kartenStapel4.length >= 1 ?
                                    Image.asset(this.oberklasse.kartenStapel4[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                  ),
                                );
                              }
                              return this.oberklasse.kartenStapel4.length >= 1?
                              this.oberklasse.rueckenStapel4 <= 0?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {streamAdd(this.oberklasse.kartenStapel4[0], 4);},
                                  child: Image.asset(this.oberklasse.kartenStapel4[0].getDateiname())
                              ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream4_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[1], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel4[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel4.length >= 2?
                                this.oberklasse.rueckenStapel4 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[1], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream4_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[2], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel4[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel4.length >= 3?
                                this.oberklasse.rueckenStapel4 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[2], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream4_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[3], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel4[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel4.length >= 4?
                                this.oberklasse.rueckenStapel4 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[3], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream4_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[4], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel4[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel4.length >= 5?
                                this.oberklasse.rueckenStapel4 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[4], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream4_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[5], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel4[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel4.length >= 6?
                                this.oberklasse.rueckenStapel4 <= 5?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[5], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[5].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream4_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel4[6], 4);},
                                      child: this.oberklasse.kartenStapel4.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel4[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                child: this.oberklasse.kartenStapel4.length >= 7?
                                this.oberklasse.rueckenStapel4 <= 6?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel4[6], 4);},
                                    child: Image.asset(this.oberklasse.kartenStapel4[6].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 8
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[7], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[7].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel7.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[7], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 9
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[8], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[8].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel7.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[8], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 10
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[9], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[9].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel7.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[9], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 11
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[10], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[10].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel7.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[10], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 12
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[11], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[11].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel7.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[11], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 13
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[12], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[12].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel7.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[12], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_14.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 14
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[13], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[13].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 390,
                                child: this.oberklasse.kartenStapel7.length >= 14?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[13], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[13].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_15.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 15
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[14], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[14].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 420,
                                child: this.oberklasse.kartenStapel7.length >= 15?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[14], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[14].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_16.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 16
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel7[15], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel7[15].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 450,
                                child: this.oberklasse.kartenStapel7.length >= 16?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[15], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[15].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                      ]),
                      //Stapel5
                      Stack(alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream5_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[0], 5);},
                                    child: this.oberklasse.kartenStapel5.length >= 1 ?
                                    Image.asset(this.oberklasse.kartenStapel5[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                  ),
                                );
                              }
                              return this.oberklasse.kartenStapel5.length >= 1?
                              this.oberklasse.rueckenStapel5 <= 0?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {streamAdd(this.oberklasse.kartenStapel5[0], 5);},
                                  child: Image.asset(this.oberklasse.kartenStapel5[0].getDateiname())
                              ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream5_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[1], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel5[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel5.length >= 2?
                                this.oberklasse.rueckenStapel5 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[1], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[2], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel5[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel5.length >= 3?
                                this.oberklasse.rueckenStapel5 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[2], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[3], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel5[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel5.length >= 4?
                                this.oberklasse.rueckenStapel5 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[3], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[4], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel5[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel5.length >= 5?
                                this.oberklasse.rueckenStapel5 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[4], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[5], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel5[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel5.length >= 6?
                                this.oberklasse.rueckenStapel5 <= 5?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[5], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[5].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel5[6], 5);},
                                      child: this.oberklasse.kartenStapel5.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel5[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                child: this.oberklasse.kartenStapel5.length >= 7?
                                this.oberklasse.rueckenStapel5 <= 6?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[6], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[6].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 8
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[7], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[7].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel5.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[7], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 9
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[8], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[8].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel5.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[8], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 10
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[9], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[9].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel5.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[9], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 11
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[10], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[10].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel5.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[10], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 12
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[11], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[11].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel5.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[11], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 13
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[12], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[12].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel5.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[12], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_14.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 14
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[13], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[13].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 390,
                                child: this.oberklasse.kartenStapel5.length >= 14?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[13], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[13].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_15.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 15
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[14], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[14].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 420,
                                child: this.oberklasse.kartenStapel5.length >= 15?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[14], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[14].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_16.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 16
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[15], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[15].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 450,
                                child: this.oberklasse.kartenStapel5.length >= 16?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[15], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[15].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream5_17.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel5.length >= 17
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel5[16], 5);},
                                        child: Image.asset(this.oberklasse.kartenStapel5[16].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 480,
                                child: this.oberklasse.kartenStapel5.length >= 17?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel5[16], 5);},
                                    child: Image.asset(this.oberklasse.kartenStapel5[16].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                      ]),
                      //Stapel6
                      Stack(alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream6_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[0], 6);},
                                    child: this.oberklasse.kartenStapel6.length >= 1 ?
                                    Image.asset(this.oberklasse.kartenStapel6[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                  ),
                                );
                              }
                              return this.oberklasse.kartenStapel6.length >= 1?
                              this.oberklasse.rueckenStapel6 <= 0?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {streamAdd(this.oberklasse.kartenStapel6[0], 6);},
                                  child: Image.asset(this.oberklasse.kartenStapel6[0].getDateiname())
                              ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream6_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[1], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel6[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel6.length >= 2?
                                this.oberklasse.rueckenStapel6 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[1], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[2], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel6[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel6.length >= 3?
                                this.oberklasse.rueckenStapel6 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[2], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[3], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel6[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel6.length >= 4?
                                this.oberklasse.rueckenStapel6 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[3], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[4], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel6[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel6.length >= 5?
                                this.oberklasse.rueckenStapel6 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[4], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[5], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel6[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel6.length >= 6?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[5], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[5].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel6[6], 6);},
                                      child: this.oberklasse.kartenStapel6.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel6[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                child: this.oberklasse.kartenStapel6.length >= 7?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[6], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[6].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 8
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[7], 7);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[7].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel6.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[7], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 9
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[8], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[8].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel6.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[8], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 10
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[9], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[9].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel6.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[9], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 11
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[10], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[10].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel6.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[10], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 12
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[11], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[11].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel6.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[11], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 13
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[12], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[12].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel6.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[12], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_14.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 14
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[13], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[13].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 390,
                                child: this.oberklasse.kartenStapel6.length >= 14?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[13], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[13].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_15.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 15
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[14], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[14].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 420,
                                child: this.oberklasse.kartenStapel6.length >= 15?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[14], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[14].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_16.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 16
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[15], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[15].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 450,
                                child: this.oberklasse.kartenStapel6.length >= 16?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[15], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[15].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_17.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 17
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[16], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[16].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 480,
                                child: this.oberklasse.kartenStapel6.length >= 17?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[16], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[16].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream6_18.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel6.length >= 18
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
                                        onPressed: () {streamAdd(this.oberklasse.kartenStapel6[17], 6);},
                                        child: Image.asset(this.oberklasse.kartenStapel6[17].getDateiname())),
                                  ),
                                ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 510,
                                child: this.oberklasse.kartenStapel6.length >= 18?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel6[17], 6);},
                                    child: Image.asset(this.oberklasse.kartenStapel6[17].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                      ]),
                      //Stapel7
                      Stack(alignment: Alignment.topCenter, children: [
                        StreamBuilder(
                            stream: stream7_1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[0], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 1 ?
                                      Image.asset(this.oberklasse.kartenStapel7[0].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  );
                              }
                              return this.oberklasse.kartenStapel7.length >= 1?
                              this.oberklasse.rueckenStapel7 <= 0?
                              ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[0], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[0].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png');
                            }),
                        StreamBuilder(
                            stream: stream7_2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 30,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[1], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 2 ?
                                      Image.asset(this.oberklasse.kartenStapel7[1].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 30,
                                child: this.oberklasse.kartenStapel7.length >= 2?
                                this.oberklasse.rueckenStapel7 <= 1?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[1], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[1].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_3.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 60,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[2], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 3 ?
                                      Image.asset(this.oberklasse.kartenStapel7[2].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 60,
                                child: this.oberklasse.kartenStapel7.length >= 3?
                                this.oberklasse.rueckenStapel7 <= 2?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[2], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[2].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_4.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 90,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[3], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 4 ?
                                      Image.asset(this.oberklasse.kartenStapel7[3].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 90,
                                child: this.oberklasse.kartenStapel7.length >= 4?
                                this.oberklasse.rueckenStapel7 <= 3?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[3], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[3].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_5.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 120,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[4], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 5 ?
                                      Image.asset(this.oberklasse.kartenStapel7[4].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 120,
                                child: this.oberklasse.kartenStapel7.length >= 5?
                                this.oberklasse.rueckenStapel7 <= 4?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[4], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[4].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_6.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[5], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 6 ?
                                      Image.asset(this.oberklasse.kartenStapel7[5].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 150,
                                child: this.oberklasse.kartenStapel7.length >= 6?
                                this.oberklasse.rueckenStapel7 <= 5?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[5], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[5].getDateiname())
                                ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_7.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData && snapshot.data != null) {
                                return Positioned(
                                  top: 180,
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.topCenter,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {streamAdd(this.oberklasse.kartenStapel7[6], 7);},
                                      child: this.oberklasse.kartenStapel7.length >= 7 ?
                                      Image.asset(this.oberklasse.kartenStapel7[6].getDateiname()) : Image.asset('playcards/versuch.png'),
                                    ),
                                  ),
                                );
                              }
                              return Positioned(
                                top: 180,
                                  child: this.oberklasse.kartenStapel7.length >= 7?
                                  this.oberklasse.rueckenStapel7 <= 6?
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[6], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[6].getDateiname())
                                  ) : Image.asset('playcards/ruecken.JPG') : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_8.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 8
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[7], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[7].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 210,
                                child: this.oberklasse.kartenStapel7.length >= 8?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[7], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[7].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_9.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 9
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[8], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[8].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 240,
                                child: this.oberklasse.kartenStapel7.length >= 9?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[8], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[8].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_10.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 10
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[9], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[9].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 270,
                                child: this.oberklasse.kartenStapel7.length >= 10?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[9], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[9].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_11.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 11
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[10], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[10].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 300,
                                child: this.oberklasse.kartenStapel7.length >= 11?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[10], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[10].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_12.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 12
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[11], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[11].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 330,
                                child: this.oberklasse.kartenStapel7.length >= 12?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[11], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[11].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_13.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 13
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[12], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[12].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 360,
                                child: this.oberklasse.kartenStapel7.length >= 13?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[12], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[12].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_14.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 14
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[13], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[13].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 390,
                                child: this.oberklasse.kartenStapel7.length >= 14?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[13], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[13].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_15.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 15
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[14], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[14].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 420,
                                child: this.oberklasse.kartenStapel7.length >= 15?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[14], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[14].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_16.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 16
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[15], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[15].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 450,
                                child: this.oberklasse.kartenStapel7.length >= 16?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[15], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[15].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_17.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 17
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[16], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[16].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 480,
                                child: this.oberklasse.kartenStapel7.length >= 17?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[16], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[16].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_18.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 18
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[17], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[17].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 510,
                                child: this.oberklasse.kartenStapel7.length >= 18?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[17], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[17].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                        StreamBuilder(
                            stream: stream7_19.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return this.oberklasse.kartenStapel7.length >= 19
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
                                              onPressed: () {streamAdd(this.oberklasse.kartenStapel7[18], 7);},
                                              child: Image.asset(this.oberklasse.kartenStapel7[18].getDateiname())),
                                        ),
                                      ) : Positioned(child: Container());
                              }
                              return Positioned(
                                top: 540,
                                child: this.oberklasse.kartenStapel7.length >= 19?
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    onPressed: () {streamAdd(this.oberklasse.kartenStapel7[18], 7);},
                                    child: Image.asset(this.oberklasse.kartenStapel7[18].getDateiname())
                                ) : Image.asset('playcards/versuch.png'),
                              );
                            }),
                      ]),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
