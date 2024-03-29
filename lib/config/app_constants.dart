import 'package:flutter/material.dart';
import '../ui/case/case_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/library/library_screen.dart';
import '../ui/profile/profile_screen.dart';

class AppConstants {
  static const List<Widget> screens = [
    HomeScreen(),
    LibraryScreen(),
    CaseScreen(),
    ProfileScreen(),
  ];
}
