class PaymentCard {
  String id;
  bool isDefault;
  String cardNumber;
  String cardHolderName;
  String cardExpiryDate;
  String cardCVV;

  PaymentCard({
    required this.id,
    required this.isDefault,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardExpiryDate,
    required this.cardCVV,
  });
}
