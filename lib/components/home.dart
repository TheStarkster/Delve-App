import 'package:flutter/material.dart';
import 'package:flutter_app/components/sub-components/bottom_bar_navigation_pattern/bottom_bar_navigation_pattern_example.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Simple Animation',
      theme: ThemeData(primaryColor: Colors.blue),
      home: BottomBarNavigationPatternExample(),
    );
  }
}
