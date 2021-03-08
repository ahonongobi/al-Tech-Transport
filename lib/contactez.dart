import 'dart:convert';

import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/constante/TextWithStyle.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class Contactez extends StatefulWidget {
  @override
  _Contactez createState() => _Contactez();
}

enum SingingCharacter { Location, Madame }

SingingCharacter _character = SingingCharacter.Location;

class _Contactez extends State<Contactez> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  String nom;
  String prenom;
  String ville;
  String email;
  String password;
  String password2;
  bool _passwordVisible;
  bool _passwordVisible2;
  Statut selectedUser;
  String statut;
  DateTime dateTimechoisie;
  String dateNaissance;
  int _nombre_de_jours;
  List<Statut> users = <Statut>[
    const Statut(
        'Location',
        Icon(
          Icons.person,
        )),
    const Statut(
        'Covoiturier',
        Icon(
          Icons.motorcycle,
        )),
    const Statut(
        'Simple',
        Icon(
          Icons.pregnant_woman,
        )),
  ];

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;

    email = '';
    password = '';
    password2 = '';
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color(0xFF008C27),
              title: Text("Message destiné au locatiare"),
            ),
            body: new SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Form(
                          key: _formKey,
                          //autovalidate: _autovalidate,
                          child: new Column(
                            children: [
                              SizedBox(height: 10.0),
                              new TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5.0),
                                      child: new Icon(Icons.account_circle)),
                                  labelText: 'Nom',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre nom";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    nom = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              new Container(
                                child: DropdownButtonFormField<Statut>(
                                  validator: (val) => val == null
                                      ? "Sélectionnez le type de véhicule"
                                      : null,
                                  value: selectedUser ?? users[0],
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    labelText:
                                        'Sélectionnez le type de véhicule',
                                    hintText:
                                        'Sélectionnez le type de véhicule',
                                    labelStyle: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  onChanged: (Statut Value) {
                                    setState(() {
                                      selectedUser = Value;
                                      statut = selectedUser.name;
                                    });
                                  },
                                  items: users.map((Statut user) {
                                    return DropdownMenuItem<Statut>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          user.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            user.name,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              new TextFormField(
                                //controller: pswController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5.0),
                                      child: new Icon(Icons.account_box)),
                                  labelText: 'Prenom',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre prenom";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    prenom = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              new TextFormField(
                                //controller: pswController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5.0),
                                      child: new Icon(Icons.message)),
                                  labelText: 'Objet de location',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrer l'objet";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    prenom = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              new TextFormField(
                                //controller: pswController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5.0),
                                      child: new Icon(Icons.message)),
                                  labelText: 'Durée de location(ex: 5jours)',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Durée de location(ex: 5jours)";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    prenom = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                onTap: () {
                                  montrerDate(); // Call Function that has showDatePicker()
                                },
                                child: IgnorePointer(
                                  child: new TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        dateTimechoisie = val as DateTime;
                                        dateNaissance = dateTimechoisie
                                            .toString()
                                            .substring(0, 10);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Date de debut?',
                                        labelStyle: new TextStyle(
                                            color: Color.fromRGBO(23, 83, 8, 1),
                                            fontWeight: FontWeight.bold),
                                        prefixIcon: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 10.0),
                                            child: new Row(
                                              children: [
                                                new Icon(Icons.date_range),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                                new TextWithStyle(
                                                    (dateTimechoisie != null)
                                                        ? dateTimechoisie
                                                            .toString()
                                                            .substring(0, 10)
                                                        : "Date de debut?",
                                                    fontSize: 20.0)
                                              ],
                                            )),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                onTap: () {
                                  montrerDate(); // Call Function that has showDatePicker()
                                },
                                child: IgnorePointer(
                                  child: new TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        dateTimechoisie = val as DateTime;
                                        dateNaissance = dateTimechoisie
                                            .toString()
                                            .substring(0, 10);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Date de fin?',
                                        labelStyle: new TextStyle(
                                            color: Color.fromRGBO(23, 83, 8, 1),
                                            fontWeight: FontWeight.bold),
                                        prefixIcon: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 10.0),
                                            child: new Row(
                                              children: [
                                                new Icon(Icons.date_range),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                                new TextWithStyle(
                                                    (dateTimechoisie != null)
                                                        ? dateTimechoisie
                                                            .toString()
                                                            .substring(0, 10)
                                                        : "Date de fin?",
                                                    fontSize: 20.0)
                                              ],
                                            )),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Center(
                                    child: TextWithStyle(
                                  'En continuant, vous acceptez les conditions générales et Politique de confidentialité de Al-Transport Tech',
                                )),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              new Material(
                                  elevation: 5.0,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  //borderRadius: BorderRadius.circular(30.0),
                                  //color: Color(0xff01A0C7),
                                  color: Color(0xFF008C27),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        if (password == password2) {
                                          userRegistration();
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SimpleDialog(
                                                  contentPadding:
                                                      EdgeInsets.all(20.0),
                                                  children: [
                                                    TextWithStyle(
                                                        'Les deux mots de passe sont non conforme')
                                                  ],
                                                );
                                              });
                                        }
                                      } else {
                                        print('Error');
                                      }
                                    },
                                    child: Text(
                                      "Confirmer",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ]),
              ),
            )));
  }

  Future<Null> montrerDate() async {
    DateTime choix = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (choix != null) {
      var difference = new DateTime.now().difference(choix);
      var jours = difference.inDays;
      var ans = (jours / 365);
      setState(() {
        _nombre_de_jours = jours;
        dateTimechoisie = choix;
      });
    }
  }

  /*void versPageMotDePasseObliee() {
                                      Navigator.push(context,
                                          new MaterialPageRoute(builder: (BuildContext context) {
                                            return new Connexion();
                                          }));
                                    }*/

  Future userRegistration() async {
    // SERVER API URL
    var url = 'http://mestps.tech/uac_mcf.php';

    // Store all data with Param Name.

    var map = Map<String, dynamic>();
    map['action'] = "ADD_USER";
    map['email'] = email;
    map['password'] = password;

    var response = await http.post(url, body: json.encode(map));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    //if (response.statusCode == 200) {}

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            message == 'Inscription effectuée avec succès'
                ? FlatButton(
                    child: new Text("Se connecter"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NavigationHomeScreen()));
                    },
                  )
                : FlatButton(
                    child: new TextWithStyle("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
          ],
        );
      },
    );
  }

  void connexion() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new Connexion(userType: null)));
  }
}

class Statut {
  const Statut(this.name, this.icon);
  final String name;
  final Icon icon;
}
