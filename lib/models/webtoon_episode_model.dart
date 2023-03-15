class WebtoonEpisodeModel {
  final String title, id, rating, date, thumb;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'],
        thumb = json['thumb'];
}
