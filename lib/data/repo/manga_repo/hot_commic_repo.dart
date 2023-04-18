import 'dart:convert';

import 'package:full_comics/data/database/commic_database.dart';
import 'package:full_comics/data/di/api_client.dart';

import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';


import 'package:http/http.dart' as http;
class HotCommicRepo{
  final ApiClient apiClient;
  const HotCommicRepo({required this.apiClient});
  // final CommicDB commicDB  = CommicDB.instance;
  Future<List<HotCommic>> fetchHotCommics() async{
    final response = await apiClient.getData('http://10.0.2.2:3000/commic/hot-commic?limit=4');
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      final listHotCommic = jsonResponse.map((e) => HotCommic.fromJson(e)).toList();
      // final result = commicDB.createHotComic(listHotCommic[0]);
      return listHotCommic;
    }else{
      throw Exception('Load failed');
    }
  }
}