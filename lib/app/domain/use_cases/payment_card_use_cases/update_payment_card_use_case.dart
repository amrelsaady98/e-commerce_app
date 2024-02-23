import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class UpdatePaymentCardUseCase extends UseCase<DataState, PaymentCard> {
  final PaymentCardsRepository _cardsRepository;

  UpdatePaymentCardUseCase(this._cardsRepository);

  /// delete card item where id = [params];
  @override
  Future<DataState> call({required PaymentCard params}) async {
    return await _cardsRepository.updatePaymentCard(params);
  }
}
