
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/repo/authentication_repository/authentication_repository.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/root_app/root_app.dart';
// import 'package:full_comics/main.dart';
// import 'package:full_comics/root_app.dart';
// import 'package:full_comics/ui/library/library_screen.dart';
import 'package:full_comics/ui/login/bloc/auth_event.dart';
import 'package:full_comics/ui/login/bloc/auth_state.dart';
// import 'package:path/path.dart';
// import 'package:path/path.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
 
  AuthBloc(this._authRepo) : super(AuthLoading()){
    on<LoginEvent>((event, emit)async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result != 'user not found') {
        emit(AuthSuccess());
        navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
      } else if(result == 'user not found'){
        emit(AuthError('Missing password'));
       
      } 
    }
    );
    on<GoogleSignInRequested>((event, emit) async{
      emit(AuthLoading());
      try {
        await _authRepo.loginWithGoogle();
      
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }
    );
    on<FacebookSignInResquested>((event, emit)async {
      emit(AuthLoading());
      try {
        await _authRepo.loginWithFacebook();
        emit(AuthSuccess());
        navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => const RootApp()));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    },
    );
  } 
}