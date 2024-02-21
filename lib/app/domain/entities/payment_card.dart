class PaymentCard {
  String id;
  String cardNumber;
  String cardHolderName;
  String cardExpiryDate;
  String cardCVV;

  PaymentCard({
    required this.cardNumber,
    required this.id,
    required this.cardHolderName,
    required this.cardExpiryDate,
    required this.cardCVV,
  });
}
