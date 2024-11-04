import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/data/models/payment_card_model.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/helpers/constants/local_storage_constants.dart';

class PaymentCardsLocalServices {
  var box = GetStorage();

  // get local card list
  DataState<List<PaymentCardModel>> getPaymentCardList() {
    try {
      Map<String, dynamic>? localData = box.read<Map<String, dynamic>>(
          LocalStorageContants.PAYMENT_CARD_LIST_KEY);
      List<PaymentCardModel> paymentCardModelList = [];
      if (localData != null) {
        for (var key in localData.keys) {
          paymentCardModelList.add(PaymentCardModel.fromJson(localData[key]));
        }
      }
      return DataSuccess(paymentCardModelList);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  DataState<PaymentCardModel?> getDefaultPaymentCard() {
    try {
      final paymentCards = getPaymentCardList();
      if (paymentCards is DataSuccess && paymentCards.data != null) {
        for (var element in paymentCards.data!) {
          if (element.isDefault) {
            return DataSuccess(element);
          }
        }
      }
      return DataSuccess(null);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(Exception(error.toString()));
    }
  }

  // save card list to local
  void saveLocalCardList(List<PaymentCardModel> cardsList) {
    try {
      box.remove(LocalStorageContants.PAYMENT_CARD_LIST_KEY);
      Map<String, dynamic> data = {};
      for (var element in cardsList) {
        data[element.id] = element.toJson();
      }
      box.write(LocalStorageContants.PAYMENT_CARD_LIST_KEY, data);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
