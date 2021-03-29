import 'dart:convert';

import 'package:best_flutter_ui_templates/choice.dart';
import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/constante/TextWithStyle.dart';
import 'package:best_flutter_ui_templates/entreprise_info.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class Inscription extends StatefulWidget {
  Inscription({Key key, @required this.userType}) : super(key: key);
  final String userType;
  @override
  _Inscription createState() => _Inscription();
}

enum SingingCharacter { Location, Madame }

SingingCharacter _character = SingingCharacter.Location;

class _Inscription extends State<Inscription> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String password2;
  bool _passwordVisible;
  bool _passwordVisible2;
  Statut selectedUser;
  String statut;

  List<Statut> users = <Statut>[
    const Statut(
        'Veuillez selectionner',
        Icon(
          Icons.person,
        )),
    const Statut(
        'Covoiturier',
        Icon(
          Icons.person,
        )),
    const Statut(
        'Taximan',
        Icon(
          Icons.motorcycle,
        )),
    const Statut(
        'Location de véhicule',
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
            body: new SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, top: 50.0, right: 25.0, bottom: 25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image.asset(
                    "assets/ADMIN-APPROVED-USER-REGISTRATION.png",
                    fit: BoxFit.fill,
                    color: Color(0xFFED2839),
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                  new TextWithStyle(
                    "Inscription",
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Form(
                      key: _formKey,
                      //autovalidate: _autovalidate,
                      child: new Column(
                        children: [
                          SizedBox(height: 10.0),
                          new TextFormField(
                            //controller: pswController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.email),
                              ),
                              labelText: 'Email',
                              labelStyle:
                                  new TextStyle(fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            // ignore: missing_return
                            validator: (val) {
                              if (RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(val)) {
                                return null;
                              } else
                                return "Entrer une adresse valide";
                            },
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          new Container(
                            child: DropdownButtonFormField<Statut>(
                              validator: (val) => val == null
                                  ? "Sélectionnez votre état"
                                  : null,
                              value: selectedUser ?? users[0],
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Statut',
                                hintText: 'Votre statut',
                                labelStyle:
                                    new TextStyle(fontWeight: FontWeight.bold),
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
                                        style: TextStyle(color: Colors.black),
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
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.vpn_key),
                              ),
                              labelText: 'Mot de passe',
                              labelStyle:
                                  new TextStyle(fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  //color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            // ignore: missing_return
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Entrez un mot de passe";
                              } else if (val.length < 6) {
                                return "Entrer au moins 6 caractéres";
                              } else
                                return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                password = val;
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
                            obscureText: !_passwordVisible2,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5.0),
                                  child: new Icon(Icons.vpn_key)),
                              labelText: 'Confirmer mot de passe',
                              labelStyle:
                                  new TextStyle(fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  //color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible2 = !_passwordVisible2;
                                  });
                                },
                              ),
                            ),
                            // ignore: missing_return
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Entrez un mot de passe";
                              } else if (val.length < 6) {
                                return "Entrer au moins 6 caractéres";
                              } else
                                return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                password2 = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Center(
                                child: TextWithStyle(
                              'En continuant, vous acceptez les conditions générales de COVOIURAGE',
                            )),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          new Material(
                              elevation: 5.0,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24.0)),
                              //borderRadius: BorderRadius.circular(30.0),
                              //color: Color(0xff01A0C7),
                              color: Color(0xFFED2839),
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                                  "S'inscrire",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new TextWithStyle(
                                'Déjà de compte?',
                                color: Colors.black,
                              ),
                              new FlatButton(
                                  onPressed: connexion,
                                  child: new TextWithStyle(
                                    'Se connecter',
                                    fontSize: 17.0,
                                    color: Color(0xFFED2839),
                                  ))
                            ],
                          )
                        ],
                      )),
                ]),
          ),
        )));
  }

  /*void versPageMotDePasseObliee() {
                                      Navigator.push(context,
                                          new MaterialPageRoute(builder: (BuildContext context) {
                                            return new Connexion();
                                          }));
                                    }*/

  Future userRegistration() async {
    // SERVER API URL
    String statut = selectedUser.name;
    if (statut == "Location de véhicule") {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Entreprise(
                userType: statut,
              )));
    }

    if (statut == "Covoiturier") {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Choice()));
    }
    if (statut == "Taximan") {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Entreprise(
                userType: null,
              )));
    }

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
