import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

import '../fintness_app_theme.dart';

class GlassViewTwo extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const GlassViewTwo({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 24),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("#D7E0F9"),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //       color: FitnessAppTheme.grey.withOpacity(0.2),
                            //       offset: Offset(1.1, 1.1),
                            //       blurRadius: 10.0),
                            // ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, bottom: 12, right: 16, top: 16),
                                child: Text(
                                  'Prepare your stomach for lunch with one or two glass of water. Prepare your stomach for lunch with one or two glass of water',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: FitnessAppTheme.nearlyDarkBlue
                                        .withOpacity(0.6),
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 68,
                                        bottom: 12,
                                        right: 10,
                                        top: 12),
                                    child: Text(
                                      'Depart : 08:00',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        color: FitnessAppTheme.nearlyDarkBlue
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.access_alarm,
                                    color: Color(0xFFED2839),
                                  ),
                                  Text(
                                    "Paris-Cotonou",
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      color: FitnessAppTheme.nearlyDarkBlue
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.0,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          bottom: 5.0,
                                          right: 16,
                                          top: 2.0),
                                      child: Icon(
                                        Icons.star,
                                        color: Color(0xFFED2839),
                                      )),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFED2839),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("message");
                                    },
                                    child: Icon(
                                      Icons.message,
                                      color: Color(0xFFED2839),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.motorcycle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.directions_car,
                                      color: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.directions_walk,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 10,
                        child: Text(
                          "250FCFA",
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFFED2839),
                            //backgroundColor: HexColor("#D7E0F9"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -12,
                        left: 0,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage("assets/images/sam.jpg")),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
