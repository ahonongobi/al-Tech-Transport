import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/showdraver.dart';
import 'package:flutter/material.dart';

class Parametre extends StatefulWidget {
  @override
  _ParametreState createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: new AppBar(
          title: Text("Informations Profile"),
          backgroundColor: Color(0xFFED2839),
          actions: <Widget>[],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/userImage.png"),
              ),
              Text(
                "Gobi abyssinie",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppTheme.darkText,
                ),
              ),
              Text(
                "abyssiniea@gmail.com",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xFFED2839),
                  ),
                  title: Text(
                    "+229 64745149",
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
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color(0xFFED2839),
                  ),
                  title: Text(
                    "abyssiniea@gmail.com",
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
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Color(0xFFED2839),
                  ),
                  title: Text(
                    "Deconnexion",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ShowdraverScreen()));
            },
            tooltip: "Rechercher",
            backgroundColor: Color(0xFFED2839),
            hoverColor: Colors.redAccent,
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
