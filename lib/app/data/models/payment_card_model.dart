import 'package:shop_app/app/domain/entities/payment_card.dart';

class PaymentCardModel extends PaymentCard {
  PaymentCardModel({
    required super.id,
    required super.cardNumber,
    required super.cardHolderName,
    required super.cardExpiryDate,
    required super.cardCVV,
  });

  factory PaymentCardModel.fromEntity(PaymentCard entity) => PaymentCardModel(
        id: entity.id,
        cardNumber: entity.cardNumber,
        cardHolderName: entity.cardHolderName,
        cardExpiryDate: entity.cardExpiryDate,
        cardCVV: entity.cardCVV,
      );
  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      PaymentCardModel(
        id: json['id'],
        cardNumber: json['card-number'],
        cardHolderName: json['card-holder-name'],
        cardExpiryDate: json['card-expiry-date'],
        cardCVV: json['card-cvv'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'card-number': cardNumber,
        'card-holder-name': cardHolderName,
        'card-expiry-date': cardExpiryDate,
        'card-cvv': cardCVV,
      };
}
