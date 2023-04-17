import 'dart:convert';
const String tableHotComics = 'hotComics';

class HotComic{
  final String? id;
  final String title;
  final String image;
  const HotComic({required this.title,required this.image,required this.id});
 
   factory HotComic.fromJson(Map<String, dynamic> json){
     return HotComic(
      id:json['id'],
     title: json['title'],
     image: json['image'],
      );
  }
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'image':image,
    };
  }
  
}
