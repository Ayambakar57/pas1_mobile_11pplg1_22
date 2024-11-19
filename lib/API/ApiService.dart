// services/api_service.dart

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_22/Widgets/PostModel.dart';


class ApiService {
  final String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3';
  

  Future<List<PlayerModel>> fetchPlayers(String teamId) async {
    final response = await http.get(Uri.parse('$baseUrl/search_all_teams.php?l=English%20Premier%20League$teamId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final teams = data['teams'] as List;
      return teams.map((json) => PlayerModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load players');
    }
  }
}
