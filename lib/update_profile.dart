import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool _validateEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFED2839),
        title: Text("Mofications profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10.0),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/userImage.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print("change profile");
                      },
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFFED2839),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("change profile");
                      },
                      child: Text(
                        "Modifier",
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFFED2839),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xFFED2839),
                        ),
                        onPressed: null),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  errorText: _validateEmail
                                      ? 'veuillez entrer l adresse'
                                      : null,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFFED2839),
                        ),
                        onPressed: null),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Numero de téléphone',
                                  errorText: _validateEmail
                                      ? 'veuillez entrer l adresse'
                                      : null,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.supervised_user_circle,
                          color: Color(0xFFED2839),
                        ),
                        onPressed: null),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Nom complet',
                                  errorText: _validateEmail
                                      ? 'veuillez entrer l adresse'
                                      : null,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFFED2839),
          onPressed: () {
            print('Submiting...');
          },
          icon: Icon(Icons.check),
          label: Text('Modifier les informations')),
    );
  }
}
