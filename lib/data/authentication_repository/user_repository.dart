// import 'dart:convert';

// import 'package:dio/dio.dart';



// import '../models/user_model.dart';

// class UserRepo{
//   final Dio dio = Dio();
//   String url = 'http://reqres.in/api/users?page=2';
//   Future<List<User>> loginUser() async{
//     Response response = await dio.get(url);
//     if (response.statusCode == 200) {
//       final List<dynamic> result = jsonDecode(response.data);
//       return result.map((e) => User.fromJson(e)).toList();
//     }else{
//       throw Exception(response.statusMessage);
//     }
//   }
// }
// import 'dart:convert';

// import 'package:full_comics/data/di/api_client.dart';
// import 'package:full_comics/data/models/result_model.dart';
// import 'package:full_comics/data/models/user_model.dart';

// class UserRepo{
//   static ApiSever<UserModel> post(url, dynamic body){
//     return ApiSever(
//       url: url,
//       body: body,
//       parse: (response) {
//         final parsed = json.decode(response.body);
//         final dataJson = ResultModel.fromJson(parsed);
//         return UserModel.fromJson(dataJson.responseData);
//       }
//     );
//   } 
// }