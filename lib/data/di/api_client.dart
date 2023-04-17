import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiClient{
  Future<dynamic> postLogin(String apiLogin,dynamic body) async{
    final response = await http.post(Uri.parse(apiLogin),
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: body);
    var responseJson = _returnResponseLogin(response);
    return responseJson;
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
    var responseJson = _returnResponseSignUp(response);
    return responseJson;
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