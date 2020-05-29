import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  static var colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink
  ];

  Widget xyloKey(int note){
    return
      Expanded(
        child: FlatButton(
          color: colors[note-1],
          onPressed: (){
            playSound(note);
          },
        ),
      );
  }

  void playSound(int n){
    final player = AudioCache();
    player.play('note$n.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              xyloKey(1),
              xyloKey(2),
              xyloKey(3),
              xyloKey(4),
              xyloKey(5),
              xyloKey(6),
              xyloKey(7),
            ],
          ),
        ),
      ),
    );
  }
}
