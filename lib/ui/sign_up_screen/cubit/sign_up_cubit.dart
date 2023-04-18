import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_state.dart';

// class SignUpCubit extends Cubit<SignUpState>{
//   final AuthRepo _authRepo;
//   SignUpCubit(this._authRepo) : super(SignUpState.initial());
//   void emailChanged(String value){
//     emit(state.copyWith(email: value,status: SignUpStatus.initial));
//   }
//   void passwordChanged(String value){
//     emit(state.copyWith(password: value,status: SignUpStatus.initial));
//   }
//   void confirmPasswordChanged(String value){
//     emit(state.copyWith(confirmPassword: value,status: SignUpStatus.initial));
//   }
//   Future<void> signUpWithEmailPassword() async{
//     if (!state.status.isFormValid)return;
//       emit(state.copyWith(status: SignUpStatus.submitting));
//      try {
//        await _authRepo.signUp(state.email, state.password);
//        emit(state.copyWith(status: SignUpStatus.success));
//      } catch (e) {
//        emit(state.copyWith(erorr: e.toString(),status: SignUpStatus.error));
//      }
//     }
// }

// 2

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());
  void onEmailChanged(String email) {
    emit(state.copyWith(email: email, status: SignUpStatus.initial));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(
        password: password,
        confirmPassword: password,
        status: SignUpStatus.initial));
  }

  // void onConfirmPasswordChanged(String confirmPassword){
  //   emit(state.copyWith(confirmPassword: confirmPassword,status: SignUpStatus.initial));
  // }
  // void onSignUpEmailAndPassword() async {
  //   if (state.status == SignUpStatus.failure) {
  //     return;
  //   }
  //   emit(state.copyWith(status: SignUpStatus.loading));
  //   try {
  //     await _authenticationService.signUpWithEmailAndPassword(
  //         email: state.email, password: state.password);
  //     emit(state.copyWith(status: SignUpStatus.success));
  //     navigatorKey.currentState!
  //         .push(MaterialPageRoute(builder: (_) => const RootApp()));
  //   } on SignUpWithEmailAndPasswordFailure catch (e) {
  //     emit(state.copyWith(
  //         status: SignUpStatus.failure, errorMessage: e.message));
  //   }
  // }
}
