import 'dart:async';

import 'package:full_comics/data/models/validation_bloc/validation.dart';

class ValidationBloc{
   final StreamController<String> _userNameController = StreamController<String>();
  final StreamController<String> _emailController = StreamController<String>();
  final StreamController<String> _passwordController = StreamController<String>();
   final StreamController<String> _confirmPasswordController = StreamController<String>();
  Stream<String> get userNameStream => _userNameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
 
  bool isValidLogin({String email = 'eve.holt@reqres.in',String password = 'cityslicka'}){
  
    if (!Validation.isValidEmail(email)) {
      _emailController.sink.addError('Email không hợp lệ');
      return false;
    }
    _emailController.add('Ok');
    if(!Validation.isValidPassword(password)) {
      _passwordController.sink.addError('Mật khẩu không hợp lệ');
      return false;
    }
    _passwordController.add('Ok');
   
    return true;
  }
  bool isValidSignUp({String userName = '',String email = 'eve.holt@reqres.in',String password = 'pistol',String confirmPassword = 'pistol'}){
    if (!Validation.isUserName(userName)) {
      _userNameController.sink.addError('Tên không hợp lệ');
      return false;
    }
    _userNameController.add('Ok');
    if (!Validation.isValidEmail(email)) {
      _emailController.sink.addError('Email không hợp lệ');
      return false;
    }
    _emailController.add('Ok');
    if(!Validation.isValidPassword(password)) {
      _passwordController.sink.addError('Mật khẩu không hợp lệ');
      return false;
    }
    _passwordController.add('Ok');
    if (!Validation.isConfirmPassword(confirmPassword)) {
      _confirmPasswordController.sink.addError('Mật khẩu không trùng khớp');
      return false;
    }
    _confirmPasswordController.add('Ok');
    return true;
  }
  void dispose(){
    _emailController.close();
    _passwordController.close();
    _userNameController.close();
  }
}