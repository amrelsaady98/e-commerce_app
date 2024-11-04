import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class PaymentCardsRepository {
  // get local card list
  Future<DataState<List<PaymentCard>>> getLocalPaymentCardList();
  // get remote card list
  Future<DataState<List<PaymentCard>>> fetchRemoteCardList();
  // get remote default payment card
  Future<DataState<PaymentCard?>> fetchRemoteDefaultPaymentCard();
  // get local default payment card 
  Future<DataState<PaymentCard?>> fetchLocalDefaultPaymentCard();
  // save local card list, returs [DataState] weather operation success or failed;
  Future<DataState> saveLocalCardList(List<PaymentCard> cardsList);
  // add card, returs [DataState] weather operation success or failed;
  Future<DataState> addPaymentCard(PaymentCard paymentCard);
  // update card, returs [DataState] weather operation success or failed;
  Future<DataState> updatePaymentCard(PaymentCard paymentCard);
  // delete card, returs [DataState] weather operation success or failed;
  Future<DataState> deletePaymentCard(String id);
}
