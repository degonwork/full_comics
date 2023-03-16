import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_failure/login_with_google_failure.dart';
import 'package:full_comics/ui/home/home_screen.dart';
import 'package:path/path.dart';

import '../../../data/models/service_models/auth_firebase_failure/login_firebase_failure.dart';
import '../../../data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import '../../../main.dart';
import '../../../root_app/root_app.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationSerivce _authenticationSerivce;
  LoginCubit(this._authenticationSerivce) : super(const LoginState());

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password.toString().trim()));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email.toString().trim()));
  }

  void onLoginWithEmailAndPasswordPressed() async {
    if (state.status == LoginStatus.failure) {}
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authenticationSerivce.logInWithEmailAndPassword(
        email: state.email.toString().trim(),
        password: state.password.toString().trim(),
      );

      navigatorKey.currentState!
          .pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));

      print(e.message);
    }
  }

  void onLoginWithGoogle() async {
    try {
      await _authenticationSerivce.loginWithGoogle();
    } on LogInWithGoogleFailure catch (e) {
      emit(
          state.copyWith(status: LoginStatus.failure, errorMessage: e.message));
    }
  }
}
