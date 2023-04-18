import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password.toString().trim()));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email.toString().trim()));
  }

  // void onLoginWithEmailAndPasswordPressed() async {
  //   if (state.status == LoginStatus.failure) {}
  //   emit(state.copyWith(status: LoginStatus.loading));
  //   try {
  //     await _authenticationSerivce.logInWithEmailAndPassword(
  //       email: state.email.toString().trim(),
  //       password: state.password.toString().trim(),
  //     );

  //     navigatorKey.currentState!
  //         .pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
  //   } on LogInWithEmailAndPasswordFailure catch (e) {
  //     emit(state.copyWith(
  //       status: LoginStatus.failure,
  //       errorMessage: e.message,
  //     ));
  //   }
  // }

  // void onLoginWithGoogle() async {
  //   try {
  //     await _authenticationSerivce.loginWithGoogle();
  //     navigatorKey.currentState!
  //         .pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
  //   } on LogInWithGoogleFailure catch (e) {
  //     emit(
  //         state.copyWith(status: LoginStatus.failure, errorMessage: e.message));
  //   }
  // }

  // void onLoginWithFacebook() async {
  //   try {
  //     await _authenticationSerivce.logInWithFacebook();
  //     navigatorKey.currentState!
  //         .pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
  //   } on LogInWithFacebookFailure catch (e) {
  //     emit(
  //         state.copyWith(status: LoginStatus.failure, errorMessage: e.message));
  //   }
  // }
}
