import 'package:best_flutter_ui_templates/api/driver-api.dart';
import 'package:best_flutter_ui_templates/api/driver.dart';
import 'package:flutter/material.dart';

class ShowMoreDriver extends StatefulWidget {
  @override
  _ShowMoreDriverState createState() => _ShowMoreDriverState();
}

Widget showMoreDriver = FutureBuilder<List<Styliste>>(
  future: fetchStylistes(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        padding: EdgeInsets.only(top: 15.0),
        children: snapshot.data
            .map((data) => Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        selectedItem(
                            context, data.nom, data.telephone, data.idstyliste);
                      },
                      child: Row(children: [
                        Container(
                            width: 200,
                            height: 100,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  "http://mestps.tech/upload/${data.photo}",
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Flexible(
                            child: Icon(Icons.phone),
                          ),
                        ),

                        // FloatingActionButton(
                        // child: Icon(Icons.phone),
                        //onPressed: () {
                        //  _calling();
                        //},
                        // backgroundColor: const Color(0xFF200087),
                        //),
                        Flexible(
                          child: Icon(Icons.message),
                        ),
                      ]),
                    ),
                    Divider(
                      color: Colors.amber,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  },
);

void selectedItem(
    BuildContext context, String nom, String telephone, String idstyliste) {}

class _ShowMoreDriverState extends State<ShowMoreDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF008C27),
        title: Text('Chauffeurs'),
      ),
      body: showMoreDriver,
    );
  }
}
