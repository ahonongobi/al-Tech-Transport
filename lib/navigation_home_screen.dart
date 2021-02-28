import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/chatscreen/home-screen.dart';
import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/feedback_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/bottom_navigation_view/bottom_bar_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/models/tabIcon_data.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/traning/training_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';
import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/localiser.dart';
import 'package:best_flutter_ui_templates/louerpages.dart';
import 'package:best_flutter_ui_templates/model/homelist.dart';
import 'package:best_flutter_ui_templates/register.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen>
    with TickerProviderStateMixin {
  Widget screenView;
  Widget screen2;
  DrawerIndex drawerIndex;
  List<HomeList> homeList = HomeList.homeList;
  AnimationController animationController;
  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    screen2 = bottomBar();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },

            screenView: Stack(
              children: <Widget>[screenView, bottomBar()],
            ),

            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Inscription(
                            userType: null,
                          )));
            } else if (index == 1 || index == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FeedbackScreen()));
            }
          },
        ),
      ],
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
          screen2 = bottomBar();
        });
      } else if (drawerIndex == DrawerIndex.HomeScreen) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.maps) {
        setState(() {
          screenView = Mappages();
        });
      } else if (drawerIndex == DrawerIndex.louer) {
        setState(() {
          screenView = Louerpages();
        });
      } else {
        //do in your way......
      }
    }
  }
}
