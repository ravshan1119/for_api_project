import 'package:for_api_project/data/network/api_provider.dart';
import 'package:for_api_project/model/card_model.dart';
import 'package:for_api_project/model/universalResponse.dart';

class CardRepository {
  final ApiProvider apiProvider;

  CardRepository({required this.apiProvider});

  Future<List<CardModel>> fetchGames() async {
    UniversalResponse universalResponse = await apiProvider.getAllCards();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<CardModel>;
    }
    return [];
  }
}
