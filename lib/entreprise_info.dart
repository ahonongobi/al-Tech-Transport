import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/constante/TextWithStyle.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';

class Entreprise extends StatefulWidget {
  Entreprise({Key key, @required this.userType}) : super(key: key);
  final String userType;
  @override
  _Entreprise createState() => _Entreprise();
}

enum SingingCharacter { Location, Madame }

SingingCharacter _character = SingingCharacter.Location;

class _Entreprise extends State<Entreprise> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  String structureName;
  String telephone;
  String quartier;
  String registre;
  String ifu;
  String namePrenom;

  String password2;
  bool _passwordVisible;
  bool _passwordVisible2;
  Statut selectedUser;
  String statut;

  List<Statut> users = <Statut>[
    const Statut(
        'Covoiturier',
        Icon(
          Icons.person,
        )),
    const Statut(
        'Entreprise',
        Icon(
          Icons.motorcycle,
        )),
    const Statut(
        'Simple',
        Icon(
          Icons.pregnant_woman,
        )),
  ];
  File _image;
  //final picker = ImagePicker();
  //Future choiceImage() async {
  //var pickedImage = await picker.getImage(source: ImageSource.gallery);
  //setState(() {
  // _image = File(pickedImage.path);
  //});
  //}

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
              leading: BackButton(
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              title: Text(
                "Informations Personnelles",
                style: TextStyle(color: Color(0xFFED2839)),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.account_circle,
                    color: Color(0xFFED2839),
                  ),
                ),
              ],
            ),
            body: new SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset(
                        "assets/ADMIN-APPROVED-USER-REGISTRATION.png",
                        fit: BoxFit.fill,
                        // color: Color(0xFFED2839),
                        height: MediaQuery.of(context).size.width / 3,
                      ),
                      //new TextWithStyle(
                      // "Informations Personnelles",
                      //fontWeight: FontWeight.bold,
                      //fontSize: 20.0,
                      //color: Colors.black,
                      //),
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
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5.0),
                                      child: new Icon(Icons.account_circle)),
                                  labelText: 'Nom de la structure',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez le nom de la structure";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    structureName = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              new TextFormField(
                                //controller: telephoneController,
                                onChanged: (val) {
                                  setState(() {
                                    telephone = val;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 5.0),
                                    child: SizedBox(
                                      child: CountryCodePicker(
                                        onChanged: (e) =>
                                            print(e.toLongString()),
                                        initialSelection: 'BJ',
                                        showCountryOnly: true,
                                        showOnlyCountryWhenClosed: false,
                                        favorite: ['+229', 'BJ'],
                                      ),
                                    ),
                                  ),
                                  labelText: 'Téléphone',
                                  labelStyle: new TextStyle(
                                      color: Color.fromRGBO(23, 83, 8, 1),
                                      fontWeight: FontWeight.bold),
                                  hintText: "64745149",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (valeur) {
                                  if (valeur.isEmpty) {
                                    return 'Entrez votre numéro de téléphone';
                                  } else if (valeur.length < 8) {
                                    return 'Saisir un numéo valide';
                                  } else
                                    return null;
                                },
                                textInputAction: TextInputAction.next,
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
                                      child: new Icon(Icons.location_city)),
                                  labelText: 'Quartier ou ville',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre quartier ou ville";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    quartier = val;
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
                                      child: new Icon(Icons.book)),
                                  labelText: 'Registre de commerce',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre registre de commerce";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    registre = val;
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
                                      child:
                                          new Icon(Icons.format_list_numbered)),
                                  labelText: 'IFU',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre IFU";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    ifu = val;
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
                                      child: new Icon(Icons.add_circle)),
                                  labelText: 'Nom et Prenom',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Entrez votre nom et prenom";
                                  } else
                                    return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    namePrenom = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              new Material(
                                  elevation: 0.0,
                                  //borderRadius: BorderRadius.circular(30.0),
                                  //color: Color(0xff01A0C7),
                                  color: Color(0xFFF0DDC5),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      //choiceImage();
                                    },
                                    child: Text(
                                      "Votre carte d'identité",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 50.0, right: 30.0),
                                  child: _image == null
                                      ? Text(
                                          "pas d'image selectionéé ",
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        )
                                      : Image.file(_image)),
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  //borderRadius: BorderRadius.circular(30.0),
                                  //color: Color(0xff01A0C7),
                                  color: Color(0xFFED2839),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: new Text(
                                                "Inscription effectuée avec succès"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: new Text("Se connecter"),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              NavigationHomeScreen()));
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      );
                                      //if (_formKey.currentState.validate()) {
                                      //if (password == password2) {
                                      //userRegistration();
                                      //} else {
                                      //showDialog(
                                      // context: context,
                                      // builder: (BuildContext context) {
                                      //return SimpleDialog(
                                      //contentPadding:
                                      // EdgeInsets.all(20.0),
                                      //children: [
                                      //TextWithStyle(
                                      //    'Les deux mots de passe sont non conforme')
                                      //],
                                      //);
                                      //});
                                      //}
                                      //} else {
                                      //print('Error');
                                      // }
                                    },
                                    child: Text(
                                      "Finaliser",
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
