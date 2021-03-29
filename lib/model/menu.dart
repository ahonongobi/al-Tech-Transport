import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeListe {
  HomeListe({
    this.navigateScreen,
    this.imagePath = '',
    this.texte,
  });

  Widget navigateScreen;
  String imagePath;
  String texte;
  static List<HomeListe> homeListe = [
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/settings.png',
      texte: "",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/tab_4.png',
      texte: "Profile",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/google-maps.png',
      texte: "",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/chat.png',
      texte: "",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v5.jpg',
      texte: "",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePath: 'assets/fitness_app/v1.jpg',
      texte: "",
      navigateScreen: HotelHomeScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/help.png',
      texte: "",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/about.png',
      texte: "",
      navigateScreen: HotelHomeScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePath: 'assets/fitness_app/taxi.png',
      texte: "",
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/design_course/design_course.png',
      imagePath: 'assets/fitness_app/v6.jpg',
      texte: "",
      navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeListe(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/area3.png',
      texte: "",
      navigateScreen: HotelHomeScreen(),
    ),
  ];
}
