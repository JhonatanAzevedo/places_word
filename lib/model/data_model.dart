import 'dart:convert';

class DataModel {
  String name;
  String img;
  String description;
  String location;
  int stars;
  int price;
  int people;
  DataModel({
    required this.name,
    required this.img,
    required this.description,
    required this.location,
    required this.stars,
    required this.price,
    required this.people,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'description': description,
      'location': location,
      'stars': stars,
      'price': price,
      'people': people,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'] as String,
      img: map['img'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      stars: map['stars'] as int,
      price: map['price'] as int,
      people: map['people'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
