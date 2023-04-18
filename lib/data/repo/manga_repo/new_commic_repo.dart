import 'dart:convert';
import 'package:full_comics/data/di/api_client.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';
import 'package:http/http.dart' as http;
class NewCommicRepo{
  final ApiClient apiClient;
  const NewCommicRepo({required this.apiClient});
  Future<List<NewCommicModel>> fetchNewCommic() async{
    final response = await apiClient.getData("http://10.0.2.2:3000/commic/new-commic?limit=4");
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      final listNewCommic = jsonResponse.map((e) => NewCommicModel.fromJson(e)).toList();
      return listNewCommic;
    } else {
      throw Exception('Load failed');
    }
  }
}