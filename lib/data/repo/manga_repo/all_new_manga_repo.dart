import 'dart:convert';

import 'package:full_comics/data/models/manga_models/all_new_manga_model.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';

import 'package:http/http.dart' as http;

class AllNewMangaRepo {
  Future<List<AllNewMangaModel>> fetchAllNewMangaRepo() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/commic/new-commic'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      final listAllNewCommic =
          jsonResponse.map((e) => AllNewMangaModel.fromJson(e)).toList();

      return listAllNewCommic;
    } else {
      throw Exception('Load failed');
    }
  }
}
