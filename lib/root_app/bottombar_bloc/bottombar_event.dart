import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BottombarEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class ChangeBottombarEvent extends BottombarEvent{
  final Widget currentScreen;
  ChangeBottombarEvent(this.currentScreen);
  @override
  List<Object> get props => [currentScreen];
}