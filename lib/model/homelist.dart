import 'package:best_flutter_ui_templates/about.dart';
import 'package:best_flutter_ui_templates/chatscreen/home-screen.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen_two.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/my_diary_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/localiser.dart';
import 'package:best_flutter_ui_templates/louerpages.dart';
import 'package:best_flutter_ui_templates/map_taxi.dart';
import 'package:best_flutter_ui_templates/model/message_model.dart';
import 'package:best_flutter_ui_templates/parametre.dart';
import 'package:best_flutter_ui_templates/profile.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.navigateScreene,
    this.imagePath = '',
    this.imagePathe = '',
    this.texte,
  });

  Widget navigateScreen;
  Widget navigateScreene;
  String imagePath;
  String texte;
  String imagePathe;
  static List<HomeList> homeList = [
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v1.jpg',
      imagePathe: 'assets/fitness_app/settings.png',
      texte: "Paramètres",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: Parametre(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v2.jpg',
      imagePathe: 'assets/fitness_app/tab_4.png',
      texte: "Profile",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: Profile(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v3.jpg',
      imagePathe: 'assets/fitness_app/google-maps.png',
      texte: "Localiser",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: Mappages(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePathe: 'assets/fitness_app/chat.png',
      imagePath: 'assets/fitness_app/v5.jpg',
      texte: "Messages",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: HomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePathe: 'assets/fitness_app/v5.jpg',
      imagePath: 'assets/fitness_app/v5.jpg',
      texte: "Trajet",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: FitnessAppHomeScreenTwo(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePathe: 'assets/fitness_app/v1.jpg',
      imagePath: 'assets/fitness_app/v6.jpg',
      texte: "louer",
      navigateScreen: HotelHomeScreen(),
      navigateScreene: HotelHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePathe: 'assets/fitness_app/help.png',
      imagePath: 'assets/fitness_app/fitness_app.png',
      texte: "Aide",
      navigateScreen: CourseInfoScreen(),
      navigateScreene: HelpScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePathe: 'assets/fitness_app/about.png',
      imagePath: 'assets/fitness_app/v1.jpg',
      texte: "A Propos",
      navigateScreen: About(),
      navigateScreene: About(),
    ),
    HomeList(
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePathe: 'assets/fitness_app/taxi.png',
      imagePath: 'assets/fitness_app/v3.jpg',
      texte: "Benin Taxi",
      navigateScreen: FitnessAppHomeScreen(),
      navigateScreene: MapTaxi(),
    ),
    HomeList(
      //imagePath: 'assets/design_course/design_course.png',
      imagePathe: 'assets/fitness_app/v6.jpg',
      imagePath: 'assets/fitness_app/v6.jpg',
      texte: "Samsung",
      navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePathe: 'assets/fitness_app/v6.jpg',
      imagePath: 'assets/fitness_app/area3.png',
      texte: "Nouveaux message",
      navigateScreen: HotelHomeScreen(),
    ),
  ];
}
