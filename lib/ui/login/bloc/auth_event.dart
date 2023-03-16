

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/ui/login/bloc/login_event.dart';
// import 'package:full_comics/ui/login/bloc/login_state.dart';
// import 'package:http/http.dart';

// import 'package:full_comics/ui/login/bloc/login_event.dart';
// import 'package:full_comics/ui/login/bloc/login_state.dart';

// import 'package:http/http.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState>{
//   LoginBloc() : super(LoginInitial()){
//     on<LoginWithEmailAndPassword>((event, emit) async {
//       emit(LoginLoading());
//       Future<void> login(String email, String password) async{
//       try {
//         Response response = await post(Uri.parse('https://reqres.in/api/login'), body: {
//           'email' : event.email,
//           'password': event.password,
//         });
//        if (response.statusCode == 200) {
//          emit(LoginSucess());
//        }
//       } catch (e) {
//         emit(LoginFailed(exception: e.toString()));
//       }
//     } });
//   }
// }
// class LoginBloc extends Bloc<LoginEvent,LoginState>{
//   LoginBloc() : super(LoginInitial()){
//    on<LoginWithEmailAndPassword>(loginWithButton);
//   }
//   Future<void> loginWithButton(event, emit) async{
//     try {
//       Response response = await post(Uri.parse('https://reqres.in/api/login'),body: {
//         'email':event.email,
//         'password':event.password,
//       });
//     } catch (e) {
      
//     }
//   }
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/data/authentication_repository/user_repository.dart';

// import 'package:full_comics/ui/login/bloc/login_event.dart';
// import 'package:full_comics/ui/login/bloc/login_state.dart';

// class LoginBloc extends Bloc<LoginEvent,LoginState>{
//   final UserRepo userRepo;
//   LoginBloc(this.userRepo) : super(const UserLoginInitialState()){
//     on<UserLoginEvent>((event, emit)async {
//       emit(const UserLoginLoading());
//       try {
//         final users = await userRepo.loginUser();
//         emit(UserLoginSucces(users));
//       } catch (e) {
//         emit(UserLoginFailed(e.toString()));
//       }
//     },
//     );
//   }
// }
// import 'package:equatable/equatable.dart';

// class AuthEvent {}
// class LoginEvent extends AuthEvent {
//   final String user;
//   final String password;
//   LoginEvent({required this.user ,required this.password});
// }
// class LogoutEvent extends AuthEvent {}
// class CheckLoginEvent extends AuthEvent{}
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:full_comics/data/models/email.dart';
// import 'package:full_comics/data/models/password.dart';

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
// class GoogleSignInRequested extends AuthEvent {}
class AuthLogoutEvent extends AuthEvent {}