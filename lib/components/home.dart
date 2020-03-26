import 'package:delve/components/sub-components/bottom_bar_navigation_pattern/bottom_bar_navigation_pattern_example.dart';
import 'package:flutter/material.dart';

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
