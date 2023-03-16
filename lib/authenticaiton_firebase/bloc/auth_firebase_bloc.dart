import 'dart:async';


import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_event.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';

import '../../data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import '../../data/models/service_models/user.dart';






class AppBloc extends Bloc<AuthFirebaseEvent, AuthFirebaseState> {
  final AuthenticationSerivce _authenticationSerivce;
  late final StreamSubscription<User> _userSubscription;

  AppBloc({required AuthenticationSerivce authenticationSerivce})
      : _authenticationSerivce = authenticationSerivce,
        super(authenticationSerivce.currentUser.isNotEmpty
            ? AuthFirebaseState.authenticated(user: authenticationSerivce.currentUser)
            : const AuthFirebaseState.unauthenticated()) {
    _userSubscription = _authenticationSerivce.user.listen((user) {
      add(UserFirebaseChanged(user));
    }
    );
    on<UserFirebaseChanged>(_appUserChanged);
    on<UserFirebaseLogout>(_logOutRequested);
  }
	
	// Xử lí event AppUserChanged
  FutureOr<void> _appUserChanged(UserFirebaseChanged event, Emitter<AuthFirebaseState> emit) {
    emit(event.user.isEmpty
        ? const AuthFirebaseState.unauthenticated()
        : AuthFirebaseState.authenticated(user: event.user)
    );
  }
	
	// Xử lí event LogOutRequested
  FutureOr<void> _logOutRequested(
      UserFirebaseLogout event, Emitter<AuthFirebaseState> emit) async {
    unawaited(_authenticationSerivce.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

