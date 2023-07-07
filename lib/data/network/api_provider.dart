import 'dart:convert';

import 'package:for_api_project/model/card_model.dart';

import '../../model/universalResponse.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalResponse> getAllCards() async {
    Uri uri = Uri.parse("https://banking-api.free.mockoapp.net/user_cards");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => CardModel.fromJson(e))
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
