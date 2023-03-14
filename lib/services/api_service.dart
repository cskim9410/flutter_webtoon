import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  Future<List<WebtoonModel>> getTodayToons() async {
    var url = Uri.parse('$baseUrl/$today');
    List<WebtoonModel> webtoonInstance = [];
    try {
      var response = await http.get(url);
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    } catch (err) {
      throw Error();
    }
  }
}
