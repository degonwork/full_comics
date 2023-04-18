
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class AuthEvent extends Equatable{
  const AuthEvent();

@override
List<Object> get props => [];
}
class LoginEvent extends AuthEvent{
  final String email;
  final String password;
  
 const  LoginEvent({required this.password ,required  this.email });
 @override 
 List<Object> get props => [email,password];
}
class GoogleSignInRequested extends AuthEvent {
  
 
}
class FacebookSignInResquested extends AuthEvent{}
class AuthLogoutEvent extends AuthEvent {}