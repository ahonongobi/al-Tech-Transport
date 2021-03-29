import 'package:best_flutter_ui_templates/about.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen_two.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/localiser.dart';
import 'package:best_flutter_ui_templates/map_taxi.dart';
import 'package:best_flutter_ui_templates/parametre.dart';
import 'package:best_flutter_ui_templates/profile.dart';
import 'package:best_flutter_ui_templates/trajets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Profile",
      subtitle: "Gobi, abyssinie",
      event: "3 Events",
      navigateScreene: Profile(),
      img: "assets/fitness_app/tab_4.png");

  Items item2 = new Items(
    title: "Trajets",
    subtitle: "Bali, cotonou...",
    event: "4 Items",
    navigateScreene: Trajets(),
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Localiser",
    subtitle: "Systeme de localisation",
    event: "",
    navigateScreene: Mappages(),
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Benin taxi",
    subtitle: "Benin texi proche",
    event: "",
    navigateScreene: MapTaxi(),
    img: "assets/fitness_app/taxi.png",
  );
  Items item5 = new Items(
    title: "Louer",
    subtitle: "vehicule,moto..",
    event: "4 Items",
    navigateScreene: HotelHomeScreen(),
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "Parametres",
    subtitle: "",
    event: "2 Items",
    navigateScreene: Parametre(),
    img: "assets/setting.png",
  );
  Items item7 = new Items(
    title: "Benin taxi",
    subtitle: "",
    event: "2 Items",
    navigateScreene: MapTaxi(),
    img: "assets/fitness_app/taxi.png",
  );
  Items item8 = new Items(
    title: "A Props",
    subtitle: "",
    event: "2 Items",
    navigateScreene: About(),
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;
    return Flexible(
      child: GridView.count(
          childAspectRatio: (itemWidth / itemHeight),
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => data.navigateScreene));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Widget navigateScreene;
  Items(
      {this.title, this.subtitle, this.event, this.img, this.navigateScreene});
}
