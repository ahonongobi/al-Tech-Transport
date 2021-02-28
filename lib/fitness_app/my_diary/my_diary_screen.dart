import 'package:best_flutter_ui_templates/chatscreen/home-screen.dart';
import 'package:best_flutter_ui_templates/connexion.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/ui_view/body_measurement.dart';
import 'package:best_flutter_ui_templates/fitness_app/ui_view/glass_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/ui_view/mediterranesn_diet_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/ui_view/title_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/meals_list_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/water_view.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_list_view.dart';
import 'package:best_flutter_ui_templates/localiser.dart';
import 'package:best_flutter_ui_templates/main_menu.dart';
import 'package:best_flutter_ui_templates/model/homelist.dart';
import 'package:best_flutter_ui_templates/parametre.dart';
import 'package:best_flutter_ui_templates/proposer_trajet.dart';
import 'package:best_flutter_ui_templates/register.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../app_theme.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen(
      {Key key,
      this.animationController,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;
  final AnimationController animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  List<HomeList> homeList = HomeList.homeList;
  AnimationController animationController;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    HomeDrawer();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

    listViews.add(
      TitleView(
        titleTxt: 'Mes trajets',
        subTxt: 'Proposer un trajet',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MediterranesnDietView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
    listViews.add(
      MediterranesnDietView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: "Aujourd'hui",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MealsListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );

    listViews.add(
      GlassView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 8, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

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
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF008C27),
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
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/userImage.png'),
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
                    onTap: () {},
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
                leading: new Icon(
                  Icons.home,
                  color: Colors.black,
                ),
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
                leading: new Icon(
                  Icons.help,
                  color: Colors.black,
                ),
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
                leading: new Icon(
                  Icons.help,
                  color: Colors.black,
                ),
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
              new ListTile(
                leading: new Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                title: new Text(
                  "Messages",
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
                      builder: (BuildContext context) => new HomeScreen()));
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.add_location,
                  color: Colors.black,
                ),
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
                  Icons.motorcycle,
                  color: Colors.black,
                ),
                title: new Text(
                  "Proposer un trajet",
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
                leading: new Icon(
                  Icons.card_travel,
                  color: Colors.black,
                ),
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
                      builder: (BuildContext context) =>
                          new HotelHomeScreen()));
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.info,
                  color: Colors.black,
                ),
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
                      builder: (BuildContext context) => new MyDiaryScreen()));
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.group,
                  color: Colors.black,
                ),
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
        body: Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 5.0)),
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget mainMenu = GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1.0),
    itemCount: 8,
    itemBuilder: (context, index) => Card(
      child: Stack(
        children: <Widget>[Image.asset("assets/fitness_app/v1.jpg")],
      ),
    ),
  );
  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'My Diary',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FitnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: FitnessAppTheme.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    '15 May',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
