import 'package:flutter/material.dart';
import 'package:tak_task/screens/astrologer_screen.dart';
import 'package:tak_task/screens/home.dart';
import 'package:tak_task/screens/panchang.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  AstrologerScreen.routeName: (context) => const AstrologerScreen(),
  PanchangScreen.routeName: (context) => const PanchangScreen()
};
