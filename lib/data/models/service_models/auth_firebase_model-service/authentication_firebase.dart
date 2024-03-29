import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_failure/login_with_google_failure.dart';
import 'package:full_comics/data/models/service_models/cache.dart';
import 'package:full_comics/data/models/service_models/user.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:full_comics/root_app/root_app.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';
import '../../../../ui/login/login_screen.dart';
import '../auth_firebase_failure/login_firebase_failure.dart';
import '../auth_firebase_failure/signup_firebase_failure.dart';


extension on firebase_auth.User {
  User get toUser {
    return User(
      id: uid,
      name: displayName,
      email: email,
      photo: photoURL,
    );
  }
}
class AuthenticationSerivce {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final CacheClient _cacheClient;

  AuthenticationSerivce({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
    CacheClient? cacheClient,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance,
        _cacheClient = cacheClient ?? CacheClient();

	static const String _userCacheKey = "user";
  Stream<User> get user {
  return _firebaseAuth.userChanges().map((firebaseUser) {
    final user = firebaseUser == null ? User.empty() : firebaseUser.toUser;
    _cacheClient.write(_userCacheKey, user);
    return user;
  });
}
User get currentUser {
  return _cacheClient.read(_userCacheKey) ?? User.empty();
}
Future<void> signUpWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.toString().trim(), password: password.toString().trim());
  } on firebase_auth.FirebaseAuthException catch (e) {
    throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
  } catch (_) {
    throw SignUpWithEmailAndPasswordFailure;
  }
}
Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw LogInWithEmailAndPasswordFailure;
    }
  }
  Future<void> signOut() async {
  await _firebaseAuth.signOut();
  navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false);
    // navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

}
Future<void> loginWithGoogle() async{
  try {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = firebase_auth.GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  } on firebase_auth.FirebaseAuthException catch (e) {
    throw LogInWithGoogleFailure.fromCode(e.code);
  } catch (_){
    throw const LogInWithGoogleFailure();
  }
}
// Future<void> loginWithFacebook() async{
//   try {
//    final loginResult = _facebookAuth.login();
//    print(loginResult);
//    final facebookCredential = firebase_auth.FacebookAuthProvider.credential(
//         loginResult.);
//   } catch (e) {
    
//   }
// }
}