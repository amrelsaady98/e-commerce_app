import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetRemoteCardsListUseCase
    extends UseCase<DataState<List<PaymentCard>>, dynamic> {
  final PaymentCardsRepository _cardsRepository;

  GetRemoteCardsListUseCase(this._cardsRepository);

  @override
  Future<DataState<List<PaymentCard>>> call({required dynamic params}) async {
    return await _cardsRepository.fetchRemoteCardList();
  }
}
