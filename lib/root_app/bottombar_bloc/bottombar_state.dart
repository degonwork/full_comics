import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:full_comics/ui/home/home_screen.dart';

class BottombarState extends Equatable{

  final Widget currentScreen;
  final int navigatorValue;
  const BottombarState({this.currentScreen = const HomeScreen(), this.navigatorValue = 0});
  @override
  List<Object> get props => [currentScreen,navigatorValue];
}
class ChangeBottombarError extends BottombarState{
  @override
  List<Object> get props => [];
}