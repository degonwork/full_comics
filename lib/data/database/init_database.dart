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