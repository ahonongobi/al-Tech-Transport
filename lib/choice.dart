import 'package:best_flutter_ui_templates/car.dart';
import 'package:best_flutter_ui_templates/design_course/design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/motorcycle.dart';
import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Choix de covoiturage",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Color(0xFF008C27),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                new Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    //borderRadius: BorderRadius.circular(30.0),
                    //color: Color(0xff01A0C7),
                    color: Color(0xFF008C27),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 3,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => InfoCar()));
                      },
                      child: Text(
                        "Voiture",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 2.0,
                          color: DesignCourseAppTheme.nearlyWhite,
                        ),
                      ),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                new Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    //borderRadius: BorderRadius.circular(30.0),
                    //color: Color(0xff01A0C7),
                    color: Color(0xFF008C27),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 3,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => InfoMoto()));
                      },
                      child: Text(
                        "Moto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 2.0,
                          color: DesignCourseAppTheme.nearlyWhite,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
