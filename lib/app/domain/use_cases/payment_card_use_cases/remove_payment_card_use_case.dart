import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class RemovePaymentCardUseCase extends UseCase<DataState, String> {
  final PaymentCardsRepository _cardsRepository;

  RemovePaymentCardUseCase(this._cardsRepository);

  /// delete card item where id = [params];
  @override
  Future<DataState> call({required String params}) async {
    return await _cardsRepository.deletePaymentCard(params);
  }
}
