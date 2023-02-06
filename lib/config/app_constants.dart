import 'package:flutter/material.dart';
import '../screens/case_screen.dart';
import '../screens/home_screen.dart';
import '../screens/library_screen.dart';
import '../screens/profile_screen.dart';

class AppConstants {
  static const List<Widget> screens = [
    HomeScreen(),
    LibraryScreen(),
    CaseScreen(),
    ProfileScreen()
  ];
}
