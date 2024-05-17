import 'package:flutter/foundation.dart';
import 'package:smart_parking_app/ApiManager/Request/PriceRequestModel.dart';

import '../Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'PriceNavigator.dart';

class ParkingViewModel extends ChangeNotifier{
  AuthenticationRepositoryContract repositoryContract;
late ParkingPriceNavigator navigator;

  ParkingViewModel(this.repositoryContract);

Price( PriceRequestModel priceRequestModel)async{
  navigator.showLoading();
  try{
    var response = await repositoryContract.Price(priceRequestModel);
    navigator.hideLoading();
    navigator.showMessage("Final price");
  }catch (e) {
    navigator.hideLoading();
    navigator.showMessage(e.toString() + " Error to show price");
  }
}
}