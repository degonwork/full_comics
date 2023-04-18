// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginWithGoogleAndFacebook {
//   Future<UserCredential> loginWithGoogle() async{
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
// }