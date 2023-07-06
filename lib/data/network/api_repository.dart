import 'package:for_api_project/data/network/api_provider.dart';
import 'package:for_api_project/model/games_model.dart';
import 'package:for_api_project/model/universalResponse.dart';

class GamesRepository {
  final ApiProvider apiProvider;

  GamesRepository({required this.apiProvider});

  Future<List<GamesModel>> fetchGames() async {
    UniversalResponse universalResponse = await apiProvider.getAllGames();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<GamesModel>;
    }
    return [];
  }
}
