import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class AddPaymentCardUseCase extends UseCase<DataState, PaymentCard> {
  final PaymentCardsRepository _cardsRepository;

  AddPaymentCardUseCase(this._cardsRepository);

  @override
  Future<DataState> call({required PaymentCard params}) async {
    return await _cardsRepository.addPaymentCard(params);
  }
}
