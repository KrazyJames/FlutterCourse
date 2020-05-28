import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Ask me anything"),
            backgroundColor: Colors.blue,
          ),
          body: MainPage(),
        ),
      ),
    );

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int ball;
  @override
  Widget build(BuildContext context) {
    ball = newRandom();
    return Container(
      color: Colors.blue.shade400,
      child: Center(
        child: FlatButton(
          onPressed: () {
            changeBall();
          },
          child: Image.asset("images/ball$ball.png"),
        ),
      ),
    );
  }
  void changeBall(){
    setState(() {
      ball = newRandom();
    });
  }
  int newRandom(){
    return Random().nextInt(5) + 1;
  }
}
