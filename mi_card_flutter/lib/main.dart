import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/yo.jpg"),
              ),
              Text(
                "Jaime Escobar",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "MOBILE DEVELOPER",
                style: TextStyle(
                  fontFamily: "Source Sans Pro",
                  fontSize: 24.0,
                  color: Colors.white.withOpacity(0.70),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.0,
                width: 128.0,
                child: Divider(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal.shade900,
                    size: 20.0,
                  ),
                  title: Text(
                    "+52 622 108 2446",
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontSize: 18.0,
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                    size: 20.0,
                  ),
                  title: Text(
                    "jaime.escobar.mtz@gmail.com",
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontSize: 18.0,
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
