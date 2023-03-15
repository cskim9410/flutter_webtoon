import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_detail_model.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayToons() async {
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

  static Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
    var url = Uri.parse('$baseUrl/$id');
    try {
      var response = await http.get(url);
      var webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } catch (err) {
      throw Error();
    }
  }
}
