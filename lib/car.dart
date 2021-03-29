import 'package:best_flutter_ui_templates/design_course/design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/main_menu.dart';
import 'package:flutter/material.dart';

class InfoCar extends StatefulWidget {
  @override
  _InfoCarState createState() => _InfoCarState();
}

class _InfoCarState extends State<InfoCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Informations moto'),
        backgroundColor: Color(0xFFED2839),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
        child: Column(
          children: <Widget>[
            new Image.asset(
              "assets/fitness_app/v1.jpg",
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(
              height: 10.0,
            ),
            new Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                elevation: 5.0,
                //borderRadius: BorderRadius.circular(30.0),
                //color: Color(0xff01A0C7),
                color: Color(0xFFED2839),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    //choiceImage();
                  },
                  child: Text(
                    "Votre carte grise",
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
              height: 20.0,
            ),
            new Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                elevation: 5.0,
                //borderRadius: BorderRadius.circular(30.0),
                //color: Color(0xff01A0C7),
                color: Color(0xFFED2839),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    //choiceImage();
                  },
                  child: Text(
                    "Assurance",
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
              height: 20.0,
            ),
            new Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                elevation: 5.0,
                //borderRadius: BorderRadius.circular(30.0),
                //color: Color(0xff01A0C7),
                color: Color(0xFFED2839),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    //choiceImage();
                  },
                  child: Text(
                    "Certificat de visite technique",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFED2839),
        onPressed: () {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Inscription effectuée avec succès"),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("Se connecter"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MainMenu()));
                    },
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
