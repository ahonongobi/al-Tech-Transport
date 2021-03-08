import 'package:best_flutter_ui_templates/constante/TextWithStyle.dart';
import 'package:flutter/material.dart';

class Proposer extends StatefulWidget {
  @override
  _ProposerState createState() => _ProposerState();
}

class _ProposerState extends State<Proposer> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String password2;
  bool _passwordVisible;
  bool _passwordVisible2;
  Statut selectedUser;
  Statut2 selectedUser2;
  String statut;
  String statut2;
  String dateNaissance;
  DateTime dateTimechoisie;
  int _nombre_de_jours;

  List<Statut2> users2 = <Statut2>[
    const Statut2(
        '06:00',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '06:10',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '06:20',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '06:30',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '06:50',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '08:20',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '08:10',
        Icon(
          Icons.timer,
        )),
    const Statut2(
        '08:20',
        Icon(
          Icons.timer,
        )),
  ];
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
              title: Text("Proposer un trajet"),
              backgroundColor: Color(0xFF008C27),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 7.0),
                  child: Icon(Icons.motorcycle),
                )
              ],
            ),
            body: new SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //new Image.asset(
                      // "assets/ADMIN-APPROVED-USER-REGISTRATION.png",
                      // fit: BoxFit.fill,
                      // color: Color(0xFF008C27),
                      //height: MediaQuery.of(context).size.width / 3,
                      //),

                      SizedBox(
                        height: 10.0,
                      ),
                      new Form(
                          key: _formKey,
                          //autovalidate: _autovalidate,
                          child: new Column(
                            children: [
                              SizedBox(height: 10.0),
                              new Container(
                                child: DropdownButtonFormField<Statut>(
                                  validator: (val) => val == null
                                      ? "Sélectionnez votre état"
                                      : null,
                                  value: selectedUser ?? users[0],
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    labelText: "D'ou partez-vous?",
                                    hintText: "D'ou partez-vous?",
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
                              SizedBox(
                                height: 10.0,
                              ),
                              new Container(
                                child: DropdownButtonFormField<Statut>(
                                  validator: (val) =>
                                      val == null ? "Ou allez-vous?" : null,
                                  value: selectedUser ?? users[0],
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    labelText: "Ou allez-vous?",
                                    hintText: "Ou allez-vous?",
                                    labelStyle: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  onChanged: (Statut value) {
                                    setState(() {
                                      selectedUser = value;
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
                              SizedBox(
                                height: 10.0,
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
                                        labelText: 'Quand partez-vous?',
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
                                                        : "Quand partez-vous?",
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
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              new Container(
                                child: DropdownButtonFormField<Statut2>(
                                  validator: (val) => val == null
                                      ? "A quelle heure souhaitez vous?"
                                      : null,
                                  value: selectedUser2 ?? users2[0],
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    labelText: "A quelle heure souhaitez vous?",
                                    hintText: "A quelle heure souhaitez vous?",
                                    labelStyle: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  onChanged: (Statut2 value2) {
                                    setState(() {
                                      selectedUser2 = value2;
                                      statut2 = selectedUser.name;
                                    });
                                  },
                                  items: users2.map((Statut2 user2) {
                                    return DropdownMenuItem<Statut2>(
                                      value: user2,
                                      child: Row(
                                        children: <Widget>[
                                          user2.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            user2.name,
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
                                    child: new Icon(Icons.verified_user),
                                  ),
                                  labelText: 'Une indice spéficique',
                                  labelStyle: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    labelText: 'Statut',
                                    hintText: 'Votre statut',
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
                                  color: Color(0xFF008C27),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
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
}

class Statut {
  const Statut(this.name, this.icon);
  final String name;
  final Icon icon;
}

class Statut2 {
  const Statut2(this.name, this.icon);
  final String name;
  final Icon icon;
}
