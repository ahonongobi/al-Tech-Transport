import 'package:best_flutter_ui_templates/constante/TextWithStyle.dart';
import 'package:flutter/material.dart';

class Louerpages extends StatefulWidget {
  @override
  _LouerpagesState createState() => _LouerpagesState();
}

class _LouerpagesState extends State<Louerpages> {
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
            body: new SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image.asset(
                    "assets/design_course/v1.jpg",
                    fit: BoxFit.fill,
                    //color: Color(0xFF008C27),
                    height: MediaQuery.of(context).size.width / 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 30),
                    child: new TextWithStyle(
                      "Poster une offre de location",
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
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
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.verified_user),
                              ),
                              labelText: 'Nom de voiture',
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
                          new TextFormField(
                            //controller: pswController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.verified_user),
                              ),
                              labelText: 'Nom de voiture',
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
                          new TextFormField(
                            //controller: pswController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.verified_user),
                              ),
                              labelText: 'Nom de voiture',
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
                          new TextFormField(
                            //controller: pswController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: new Icon(Icons.verified_user),
                              ),
                              labelText: 'Nom de voiture',
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
                              //borderRadius: BorderRadius.circular(30.0),
                              //color: Color(0xff01A0C7),
                              color: Color(0xFF008C27),
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                  } else {
                                    print('Error');
                                  }
                                },
                                child: Text(
                                  "Valider",
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
}

class Statut {
  const Statut(this.name, this.icon);
  final String name;
  final Icon icon;
}
