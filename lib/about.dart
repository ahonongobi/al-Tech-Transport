import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/contactez_nous.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF008C27),
        title: Text(
          "A propos de nous",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    "1-1 Présentation\n\nAujourd’hui, la circulation est devenue une activités au quotidien de plusieurspersonnes. Mais rare est de constater ceux qui disposent de leurs propres en gins, de déplacement. Ces gens, zém ou cherchent àtransporter des colis d’un endroit à un autre à faible coût ou voir même gratuitement mais ne trouvent pas.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
              Card(
                //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    "1-1 Présentation\n\nAujourd’hui, la circulation est devenue une activités au quotidien de plusieurspersonnes. Mais rare est de constater ceux qui disposent de leurs propres en gins, de déplacement. Ces gens, zém ou cherchent àtransporter des colis d’un endroit à un autre à faible coût ou voir même gratuitement mais ne trouvent pas.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
              Card(
                //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    "1-1 Présentation\n\nAujourd’hui, la circulation est devenue une activités au quotidien de plusieurspersonnes. Mais rare est de constater ceux qui disposent de leurs propres en gins, de déplacement. Ces gens, zém ou cherchent àtransporter des colis d’un endroit à un autre à faible coût ou voir même gratuitement mais ne trouvent pas.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
              Card(
                //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Text(
                    "1-1 Présentation\n\nAujourd’hui, la circulation est devenue une activités au quotidien de plusieurspersonnes. Mais rare est de constater ceux qui disposent de leurs propres en gins, de déplacement. Ces gens, zém ou cherchent àtransporter des colis d’un endroit à un autre à faible coût ou voir même gratuitement mais ne trouvent pas.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF008C27),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ContactezUs()));
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
