import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'package:tds_aplicativo_futebol/soccermodel.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2022&league=71";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "8e7582d7740b05b3c5bc4a08a72f4b7f"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    } else {
      // Trate o caso em que a resposta não foi bem-sucedida
      throw Exception('Falha ao carregar partidas: ${res.statusCode}');
    }
  }
}
