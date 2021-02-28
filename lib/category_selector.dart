import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Color(0xFF008C27),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BackButton(color: Colors.white),
      ),
    );
  }
}
