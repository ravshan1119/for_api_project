class CardModel {

  final int id;
  final String cardType;
  final String cardNumber;
  final String bankName;
  final double moneyAmount;
  final String cardCurrency;
  final String expireDate;
  final String iconImage;
  final Map<String, String> colors;

  CardModel(
      {required this.id,
      required this.bankName,
      required this.cardCurrency,
      required this.cardNumber,
      required this.cardType,
      required this.colors,
      required this.expireDate,
      required this.iconImage,
      required this.moneyAmount});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json["id"] as int? ?? 0,
      bankName: json["bank_name"] as String? ?? "",
      cardCurrency: json["card_currency"] as String? ?? "",
      cardNumber: json["card_number"] as String? ?? "",
      cardType: json["card_type"] as String? ?? "",
      colors: json["colors"] as Map<String, String>? ?? {},
      expireDate: json["expire_date"] as String? ?? "",
      iconImage: json["icon_image"] as String? ?? "",
      moneyAmount: json["money_amount"] as double? ?? 0,
    );
  }
}
