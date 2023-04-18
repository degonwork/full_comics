class NewCommicModel {
  final String id;
  final String title;
  final Image image;
  const NewCommicModel(
      {required this.id, required this.image, required this.title});
  factory NewCommicModel.fromJson(Map<String, dynamic> json) {
    return NewCommicModel(
      id: json['id'],
        image: Image.fromJson(json['image']),
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

class Image {
  final String? image_detail;
  final String? image_thumnail_square;
  final String? image_thumnail_rectangle;
  const Image({required this.image_detail, required this.image_thumnail_square, required this.image_thumnail_rectangle});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      image_detail: json["image_detail"],
      image_thumnail_square: json['image_thumnail_square'],
      image_thumnail_rectangle: json['image_thumnail_rectangle'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'image_detail': image_detail,
      'image_thumnail_square': image_thumnail_square,
      'image_thumnail_rectangle': image_thumnail_rectangle,
    };
  }
}
