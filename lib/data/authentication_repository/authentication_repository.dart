import 'dart:convert';
import 'package:full_comics/data/di/api_client.dart';

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
  // Future<void> signInWithGoogle() async{
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount  = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
  //     final  credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication?.accessToken,
  //       idToken: googleSignInAuthentication?.idToken,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
