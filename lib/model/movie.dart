import 'dart:convert';

class Movie {
  final String name;
  final String image;
  final String desc;
  final String link;
  Movie({
    required this.name,
    required this.image,
    required this.desc,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'desc': desc,
      'link': link,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['name'] as String,
      image: map['image'] as String,
      desc: map['desc'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
