import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_espisode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // succesful
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    }
    throw Error();
  }

  Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // succesful
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(String id) async {
    List<WebtoonEpisodeModel> episodesInstacne = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // succesful
      final List<dynamic> episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        episodesInstacne.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstacne;
    }
    throw Error();
  }
}
