import 'dart:convert';

import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
// Future<List<HotComic>> createToDB({List<HotComic>? hotComics})async{
//   List<HotComic> list = [];
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/home'));
//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = jsonDecode(response.body)['hot_commic'];
//       final listHotCommic = jsonResponse.map((e) => HotComic.fromJson(e)).toList();
     
//     }else{
//       throw Exception('Load failed');
//     }
// }