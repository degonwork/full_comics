class AllNewMangaModel{
   final String id;
  final String title;
  final String image;
  const AllNewMangaModel({required this.id,required this.image,required this.title});
  factory AllNewMangaModel.fromJson(Map<String, dynamic> json){
    return AllNewMangaModel(id: json['id'], image: json['image'], title: json['title']);
  }
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'image':image,
      'title':title,
    };
  }
}