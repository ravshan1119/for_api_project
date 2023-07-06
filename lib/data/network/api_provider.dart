import 'dart:convert';

import 'package:for_api_project/model/games_model.dart';

import '../../model/universalResponse.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalResponse> getAllGames() async {
    Uri uri = Uri.parse("https://www.freetogame.com/api/games");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => GamesModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "error");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
