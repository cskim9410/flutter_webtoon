class WebtoonDetailModel {
  String title, genre, about, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        genre = json['genre'],
        about = json['about'],
        age = json['age'];
}
