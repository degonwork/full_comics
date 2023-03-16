
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class AuthState extends Equatable{
}
// class AuthInitial extends AuthState{
// @override
// List<Object> get props => [];
// }
class AuthLoading extends AuthState{
  @override
  List<Object> get props => [];
}
class AuthSuccess extends AuthState{
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState{
  final String msgError;
  AuthError(this.msgError);
  @override
  List<Object> get props => [msgError];
}
