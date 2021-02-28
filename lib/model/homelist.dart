import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.texte,
  });

  Widget navigateScreen;
  String imagePath;
  String texte;
  static List<HomeList> homeList = [
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v1.jpg',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v2.jpg',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v3.jpg',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v5.jpg',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v5.jpg',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePath: 'assets/fitness_app/v6.jpg',
      texte: "Range hover",
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/fitness_app.png',
      texte: "Range hover",
      navigateScreen: CourseInfoScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/v1.jpg',
      texte: "Range hover",
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/fitness_app/fitness_app.png',
      imagePath: 'assets/fitness_app/v3.jpg',
      texte: "Toyota",
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/design_course/design_course.png',
      imagePath: 'assets/fitness_app/v6.jpg',
      texte: "Samsung",
      navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeList(
      //imagePath: 'assets/hotel/hotel_booking.png',
      imagePath: 'assets/fitness_app/area3.png',
      texte: "Nouveaux message",
      navigateScreen: HotelHomeScreen(),
    ),
  ];
}
