import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:full_comics/data/di/api_client.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final ApiClient _apiClient = ApiClient();
  Future<dynamic> login(String? email, String? password) async {
    final response = await _apiClient.postLogin(
      'http://10.0.2.2:3000/auth/login',
      jsonEncode(<String, String?>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<dynamic> signUp(String? email, String? password) async {
    final response =
        await _apiClient.postSignUp('https://reqres.in/api/register', {
      "email": email,
      "password": password,
    });
    return response;
  }
//  Future<UserCredential> loginWithGoogle() async{

//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//   Future<UserCredential> loginWithFacebook()async{
//     final LoginResult loginResult = await FacebookAuth.instance.login();
//     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   }
}
