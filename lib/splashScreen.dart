import 'dart:async';

import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Connexion(
                  userType: null,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008C27),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFF008C27)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFF008C27),
                        radius: 100.0,
                        //child: Icon(
                        //Icons.add_location,
                        //size: 50.0,
                        //color: Colors.indigo,
                        //),
                        child: Image.asset("assets/fitness_app/BA.png"),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                    ],
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.04)),
                    CircleAvatar(
                      backgroundColor: Color(0xFF008C27),
                      radius: 70.0,
                      //child: Icon(
                      //Icons.add_location,
                      //size: 50.0,
                      //color: Colors.indigo,
                      //),
                      child: Image.asset("assets/fitness_app/taxi.png"),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      "Al-Tech Transport",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                flex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
