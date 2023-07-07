import 'package:flutter/material.dart';
import 'package:for_api_project/data/network/api_repository.dart';
import 'package:for_api_project/model/card_model.dart';
import 'package:for_api_project/ui/card_detail/card_detail_screen.dart';

import '../../data/network/api_provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final CardRepository cardRepository =
      CardRepository(apiProvider: ApiProvider());

  List<CardModel> card = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    card = await cardRepository.fetchGames();
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
        title: const Text("cards"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : card.isEmpty
              ? const Center(
                  child: Text("xatolik sodir boldi!"),
                )
              : ListView(
                  children: List.generate(
                    card.length,
                    (index) => ListView(children: [
                      ...List.generate(
                          card.length,
                          (index) => CardDetailScreen(
                              name: card[index].bankName,
                              cardNumber: card[index].cardNumber,
                              balance: card[index].cardCurrency,
                              imagePath: card[index].iconImage))
                    ]),
                  ),
                ),
    );
  }
}
