import 'package:flutter/material.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen(
      {Key? key,
      required this.name,
      required this.cardNumber,
      required this.balance,
      required this.imagePath})
      : super(key: key);

  final String name;
  final String cardNumber;
  final String balance;
  final String imagePath;

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 367,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Text(
              widget.cardNumber,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 29,
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      "Balance",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.balance,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 60,
                    width: 90,
                    child: Image.network(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
