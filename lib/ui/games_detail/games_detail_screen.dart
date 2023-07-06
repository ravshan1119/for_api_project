import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/games_model.dart';

class GamesDetailScreen extends StatefulWidget {
  GamesDetailScreen({required this.gamesModel, Key? key}) : super(key: key);
  GamesModel gamesModel;

  @override
  State<GamesDetailScreen> createState() => _GamesDetailScreenState();
}

class _GamesDetailScreenState extends State<GamesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        title: const Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.gamesModel.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      widget.gamesModel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "Company: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.publisher,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: "Genre: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.genre,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: "Support platforms: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.platform,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: "Release data: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.releaseDate,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: "Description: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.shortDescription,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: "Link to download: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.gamesModel.freetogameProfileUrl,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            throw Exception(
                                'Could not launch ${widget.gamesModel.freetogameProfileUrl}');
                          })
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
