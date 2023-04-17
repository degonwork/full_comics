class NewCommicModel {
  final String id;
  final String title;
  final String image;
  const NewCommicModel(
      {required this.id, required this.image, required this.title});
  factory NewCommicModel.fromJson(Map<String, dynamic> json) {
    return NewCommicModel(
      id: json['id'],
      image: json['image'],
      title: json['title']
      );
  }
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'image':image,
      'title':title,
    };
  }
}
