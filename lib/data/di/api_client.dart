// import 'package:dio/dio.dart';

// class ApiClient{
//   final Dio _dio =Dio();
//  late String baseUrl;
//   ApiClient(){
//     _dio.options = BaseOptions(
//       baseUrl: baseUrl,
//       receiveTimeout: 1000,
//       connectTimeout: 10000,
//       sendTimeout: 10000,
      
//     );
//   }
//   // Future<Response> login(String email,String password) async{
//   //   try {
//   //     Response response = await _dio.post('https://reqres.in/api/login',data: {
//   //       'email':email,
//   //       'password': password,
//   //     }
//   //     );
//   //     return response;
//   //   } on DioError catch (e) {
//   //     return Response(statusMessage: e.message,requestOptions: RequestOptions(path: 'https://reqres.in/api/login'));
//   //   }
//   // }
 
// }
// import 'dart:convert';

// import 'package:full_comics/config/constant.dart';
// import 'package:http/http.dart' as http;
// class ApiSever<T>{
//   final String url;
//   final dynamic body;
//   T Function(http.Response response) parse;
//   ApiSever({required this.url, required this.body, required this.parse});
// }
// class ApiConnect{
//   Future<T> getData<T>(ApiSever<T> resource) async {
//     final respone = await http.get(Uri.parse(apiUrl + resource.url));
//     if (respone.statusCode == 200) {
//       return resource.parse(respone);
//     } else{
//       throw Exception(respone.statusCode);
//     }
//   }
//   Future<T> postData<T>(ApiSever<T> resource) async {
//     Map<String ,String> header = {
//       "Content-Type": "application/json"
//     };
//     final respone = await http.post(Uri.parse(apiUrl + resource.url),body: jsonEncode(resource.body), headers: header);
//     if (respone.statusCode == 200) {
//       return resource.parse(respone);
//     } else {
//       throw Exception(respone.statusCode);
//     }
//   }
// }
import 'dart:convert';

// import 'package:full_comics/config/constant.dart';
import 'package:http/http.dart' as http;
class ApiClient{
  Future<dynamic> postLogin(String apiLogin,dynamic body) async{
    // final response = await http.post(Uri.parse(apiLogin),body: body);
    final response = await http.post(
      Uri.parse(apiLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body
    );
    print(response.body);
    // var responseJson = _returnResponseLogin(response);
    // return responseJson;

  }
  _returnResponseLogin(http.Response response){
    switch(response.statusCode){
      case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson["token"];
      case 400:
      var responseError = jsonDecode(response.body.toString());
      return responseError["error"];
      default:
      return Exception('default error ${response.statusCode.toString()}');

    }

  }
  Future<dynamic> postSignUp(String apiSignUp, dynamic body) async{
    final response = await http.post(Uri.parse(apiSignUp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    // var responseJson = _returnResponseSignUp(response);
    print(response.body);
    // return responseJson;
  }
  _returnResponseSignUp(http.Response response){
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson["token"];
        case 400:
        var responseError = jsonDecode(response.body.toString());
        return responseError['error'];
      default:
      return Exception('default erorr ${response.statusCode.toString()}');
    }
  }
}