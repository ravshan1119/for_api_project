import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_api_project/data/network/api_provider.dart';
import 'package:for_api_project/data/network/api_repository.dart';
import 'package:for_api_project/model/games_model.dart';
import 'package:for_api_project/ui/games_detail/games_detail_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  final GamesRepository gamesRepository =
      GamesRepository(apiProvider: ApiProvider());

  List<GamesModel> games = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    games = await gamesRepository.fetchGames();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        backgroundColor: Colors.yellow,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : games.isEmpty
              ? const Center(
                  child: Text("xatolik sodir boldi!"),
                )
              : ListView(
                  children: List.generate(
                      games.length,
                      (index) => ListTile(
                            leading: Image.network(games[index].thumbnail),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GamesDetailScreen(
                                      gamesModel: games[index]),
                                ),
                              );
                            },
                            title: Text(games[index].title),
                            subtitle: Text(games[index].developer),
                          )),
                ),
    );
  }
}
