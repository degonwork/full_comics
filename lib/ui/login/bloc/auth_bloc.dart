// // import 'package:equatable/equatable.dart';
// // // import 'package:full_comics/ui/login/bloc/login_event.dart';
// // // import 'package:full_comics/ui/login/status/form_submission_status.dart';

// //  abstract class LoginState extends Equatable{
// //   const LoginState();
// //   @override
// //   List<Object> get props => [];
// // }
// // class LoginInitial extends LoginState{}
// // class LoginLoading extends LoginState{}
// // class LoginSucess extends LoginState{}
// // class LoginFailed extends LoginState{
// //   final String exception;
// //   const LoginFailed({required this.exception});
// // }

// import 'package:equatable/equatable.dart';
// import 'package:full_comics/data/models/user_model.dart';


// abstract class LoginState extends Equatable{
 
//  const LoginState();
//  @override
//  List<Object?> get props => [];
// }

// class UserLoginInitialState extends LoginState{
//   const UserLoginInitialState();
//   @override
//   List<Object?> get props => [];
// }
// class UserLoginLoading extends LoginState{
//   const UserLoginLoading();
//   @override
//   List<Object> get props => [];
// }
// class UserLoginSucces extends LoginState{
//  final List<User> user;
//  const UserLoginSucces(this.user);
//  @override
//  List<Object?> get props => [user];
// }
// class UserLoginFailed extends LoginState{
//   final String error;
//  const UserLoginFailed( this.error) : super();
//   @override
//   List<Object?> get props => [error];
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
// import 'package:full_comics/ui/home/home_screen.dart';
// import 'package:full_comics/ui/login/bloc/auth_event.dart';
// import 'package:full_comics/ui/login/bloc/auth_state.dart';
// import 'package:path/path.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState>{
//   final AuthenticationRepository authenticationRepository;
//   AuthBloc({required this.authenticationRepository}) : super(UnAuthenticated()){
//     on<AuthLoginEvent>((event ,emit) async {
//       emit(Loading());
//       try {
//         authenticationRepository.login(email: event.email, password: event.password);
//         emit(LoginSucces());
//       } catch (e) {
//         emit(UnAuthenticated());
//       }
//     });
//   }

// }
// import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
// import 'package:full_comics/main.dart';
// import 'package:full_comics/root_app.dart';
// import 'package:full_comics/ui/library/library_screen.dart';
import 'package:full_comics/ui/login/bloc/auth_event.dart';
import 'package:full_comics/ui/login/bloc/auth_state.dart';
// import 'package:path/path.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
 
  AuthBloc(this._authRepo) : super(AuthLoading()){
    on<LoginEvent>((event, emit)async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      print(result);
      if (result != 'user not found') {
        emit(AuthSuccess());
        // print('Login success');
      } else if(result == 'user not found'){
        emit(AuthError('Missing password'));
        print('Login Failed');
      } 
    }
    );
    // on<GoogleSignInRequested>((event, emit) async{
    //   emit(AuthLoading());
    //   try {
    //     await _authRepo.signInWithGoogle();
    //     emit(AuthSuccess());
    //   } catch (e) {
    //     emit(AuthError(e.toString()));
        
    //   }
    // });
  }
}