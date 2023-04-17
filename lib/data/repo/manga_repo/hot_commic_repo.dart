import 'dart:convert';

import 'package:full_comics/data/database/commic_database.dart';

import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';


import 'package:http/http.dart' as http;
class HotCommicRepo{
  final CommicDB commicDB  = CommicDB.instance;
  Future<List<HotComic>> fetchHotComics() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/commic/hot-commic'));
   
   
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
   
      final listHotCommic = jsonResponse.map((e) => HotComic.fromJson(e)).toList();
      
      final result = commicDB.createHotComic(listHotCommic[0]);
      
      
    
     
      return listHotCommic;
    }else{
      throw Exception('Load failed');
    }
  }
  
}