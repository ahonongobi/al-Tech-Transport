import 'dart:ui';

import 'package:best_flutter_ui_templates/about.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/chatscreen/home-screen.dart';
import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/contactez_nous.dart';
import 'package:best_flutter_ui_templates/design_course/models/recommended_model.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/localiser.dart';
import 'package:best_flutter_ui_templates/map_taxi.dart';
import 'package:best_flutter_ui_templates/model/homelist.dart';
import 'package:best_flutter_ui_templates/parametre.dart';
import 'package:best_flutter_ui_templates/profile.dart';
import 'package:best_flutter_ui_templates/proposer_trajet.dart';
import 'package:best_flutter_ui_templates/register.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'griddashboard.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

List<HomeList> homeList = HomeList.homeList;

Widget mainMenu = GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4, childAspectRatio: 1.0),
  itemCount: homeList.length - 2,
  itemBuilder: (context, index) => Card(
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) =>
                  homeList[index].navigateScreene));
        },
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, left: 15.0),
              child: Image.asset(
                "${homeList[index].imagePathe}",
                height: 100,
              ),
            ),
            //NetworkImage("${recommendations[index].image}")

            Positioned(
              child: Text(
                "${homeList[index].texte}",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppTheme.darkText,
                ),
              ),
              bottom: 5.0,
            )
          ],
        ),
      ),
    ),
  ),
);

Widget actualite = Container(
  height: 100.4,
  margin: EdgeInsets.only(top: 16),
  child: PageView(
      //final _pageController = PageController(viewportFraction: 0.877);
      physics: BouncingScrollPhysics(),
      controller: PageController(viewportFraction: 0.877),
      scrollDirection: Axis.horizontal,
      children: List.generate(
          recommendations.length,
          (index) => Container(
                margin: EdgeInsets.only(right: 28.8),
                width: 333.6,
                height: 150.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendations[index].image))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 19.2,
                        left: 19.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.8),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                            child: Container(
                              height: 36,
                              padding:
                                  EdgeInsets.only(left: 16.72, right: 14.4),
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                      "assets/svg/icon_location.svg"),
                                  SizedBox(
                                    width: 9.52,
                                  ),
                                  Text(recommendations[index].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.8,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ))),
);
Widget titre = Text(
  'Actualité et Promotions',
  style: TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppTheme.darkText,
  ),
);
Widget widget2() {
  return Container(
    height: 250,
    child: Carousel(
      boxFit: BoxFit.fill,
      images: [
        AssetImage("assets/fitness_app/v1.jpg"),
        AssetImage("assets/fitness_app/v2.jpg"),
        AssetImage("assets/fitness_app/v3.jpg")
      ],
    ),
  );
}

class _MainMenuState extends State<MainMenu> {
  void handleClick(String value) {
    switch (value) {
      case 'Connexion':
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Connexion(
                  userType: null,
                )));

        break;
      case 'Inscription':
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Inscription(
                  userType: null,
                )));
        break;
      case 'Paramètre':
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Parametre()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Al-Tech Transport"),
        backgroundColor: Color(0xFFED2839),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              Share.share('check out my app playstor app link');
            },
          ),
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Connexion', 'Inscription', 'Paramètre'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.6),
                        offset: const Offset(2.0, 4.0),
                        blurRadius: 8),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Profile()));
                  },
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/userImage.png'),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 8, left: 4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: new ListTile(
                title: new Text(
                  "Gobi abyssinie",
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppTheme.darkText,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Se deconnecter',
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Connexion(
                                  userType: null,
                                )));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
            new ListTile(
              title: new Text(
                "Acceuil",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              leading: new Icon(Icons.home, color: Color(0xFFED2839)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new MainMenu()));
              },
            ),
            new ListTile(
              title: new Text(
                "Mes trajets",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              leading: new Icon(Icons.help, color: Color(0xFFED2839)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new FitnessAppHomeScreen()));
              },
            ),
            new ListTile(
              title: new Text(
                "Aides",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              leading: new Icon(Icons.help, color: Color(0xFFED2839)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new HelpScreen()));
              },
            ),
            //new ListTile(
            //title: new Text("Inscription"),
            //leading: new Icon(Icons.account_box),
            //onTap: () {
            // Navigator.of(context).pop();

            //Navigator.of(context).push(new MaterialPageRoute(
            //    builder: (BuildContext context) => new SignUpScreen()));
            //},
            //),
            //new ListTile(
            //leading: new Icon(
            // Icons.message,
            // color: Color(0xFFED2839)
            //),
            //title: new Text(
            //"Messages",
            //style: TextStyle(
            // fontFamily: AppTheme.fontName,
            // fontWeight: FontWeight.w600,
            // fontSize: 16,
            // color: AppTheme.darkText,
            //),
            //),
            //onTap: () {
            //Navigator.of(context).pop();
            //Navigator.of(context).push(new MaterialPageRoute(
            // builder: (BuildContext context) => new HomeScreen()));
            // },
            //),
            new ListTile(
              leading: new Icon(Icons.add_location, color: Color(0xFFED2839)),
              title: new Text(
                "Localiser",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Mappages()));
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.move_to_inbox,
                color: Color(0xFFED2839),
              ),
              title: new Text(
                "Benin taxi",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new MapTaxi()));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.motorcycle, color: Color(0xFFED2839)),
              title: new Text(
                "Proposer  un trajet",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Proposer()));
              },
            ),

            new ListTile(
              leading: new Icon(Icons.card_travel, color: Color(0xFFED2839)),
              title: new Text(
                "Louer un vehicule",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new HotelHomeScreen()));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Color(0xFFED2839)),
              title: new Text(
                "A Propos de nous",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new About()));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.group, color: Color(0xFFED2839)),
              title: new Text(
                "Inviter un ami",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          GridDashboard(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0, left: 15.0),
            child: titre,
          ),
          actualite,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFED2839),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Proposer()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
