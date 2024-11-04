import 'package:flutter/foundation.dart';
import 'package:shop_app/app/data/data_sources/loacl/payment_cards_loacl_services.dart';
import 'package:shop_app/app/data/data_sources/remote/payment_cards_api_services.dart';
import 'package:shop_app/app/data/models/payment_card_model.dart';
import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class PaymentCardsRepositoryImpl extends PaymentCardsRepository {
  final PaymentCardsLocalServices _localServices;
  final PaymentCardsApiServices _apiServices;

  PaymentCardsRepositoryImpl(this._localServices, this._apiServices);

  @override
  Future<DataState> addPaymentCard(PaymentCard paymentCard) async {
    try {
      // send [paymentCard] to remote server
      final remoteResponse = await _apiServices
          .addPaymentCard(PaymentCardModel.fromEntity(paymentCard));
      // save to local if remote success
      if (remoteResponse is DataSuccess) {
        // get locally saved card list;
        List<PaymentCardModel>? localData =
            _localServices.getPaymentCardList().data;
        // if [localSavedData] is null it's first item to add;
        if (localData != null) {
          // add new [paymentCard] to list then save to local;
          final paymentCardModel = PaymentCardModel.fromEntity(paymentCard);
          localData.add(paymentCardModel);
          _localServices.saveLocalCardList(localData);
          return DataSuccess(null);
        } else {
          // send to local new list with new item to add;
          _localServices
              .saveLocalCardList([PaymentCardModel.fromEntity(paymentCard)]);
          return DataSuccess(null);
        }
      } else {
        return remoteResponse;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  @override
  Future<DataState> deletePaymentCard(String id) async {
    try {
      final remoteresponse = _apiServices.removePaymentCard(id);
      // get locally saved card list;
      List<PaymentCardModel>? localData =
          _localServices.getPaymentCardList().data;
      if (remoteresponse is DataSuccess && localData != null) {
        localData.removeWhere((element) => element.id == id);
        _localServices.saveLocalCardList(localData);
        return DataSuccess(null);
      }
      return DataField(Exception('cannot delete unexisting item'));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  @override
  Future<DataState<List<PaymentCard>>> fetchRemoteCardList() async {
    return await _apiServices.fetchPaymentCardList();
  }

  @override
  Future<DataState<List<PaymentCard>>> getLocalPaymentCardList() async {
    return await _localServices.getPaymentCardList();
  }

  @override
  Future<DataState> saveLocalCardList(List<PaymentCard> cardsList) async {
    try {
      List<PaymentCardModel> data = [];
      for (var element in cardsList) {
        data.add(PaymentCardModel.fromEntity(element));
      }
      _localServices.saveLocalCardList(data);
      return DataSuccess(null);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  @override
  Future<DataState> updatePaymentCard(PaymentCard paymentCard) async {
    try {
      /* final remoteResponse = await _apiServices
          .updatePaymentCard(PaymentCardModel.fromEntity(paymentCard)); */
      // get locally saved card list;
      List<PaymentCardModel>? localData =
          _localServices.getPaymentCardList().data;
      // if [localSavedData] is null it's first item to add;
      if (localData != null && localData.isNotEmpty) {
        final paymentCardModel = PaymentCardModel.fromEntity(paymentCard);
        final itemIndex =
            localData.indexWhere((element) => element.id == paymentCard.id);
        if (itemIndex >= 0) {
          localData[itemIndex] = paymentCardModel;
          _localServices.saveLocalCardList(localData);
          return DataSuccess(null);
        } else {
          return DataField(Exception('Item did not found in Local Storage'));
        }
      } else {
        return DataField(Exception('No Cards Saved in Local Storage!'));
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  @override
  Future<DataState<PaymentCard?>> fetchLocalDefaultPaymentCard() async {
    return _localServices.getDefaultPaymentCard();
  }

  @override
  Future<DataState<PaymentCard?>> fetchRemoteDefaultPaymentCard() {
    // TODO: implement fetchRemoteDefaultPaymentCard
    throw UnimplementedError();
  }
}
