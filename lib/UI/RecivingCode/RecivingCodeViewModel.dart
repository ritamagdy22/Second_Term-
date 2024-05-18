import 'package:flutter/cupertino.dart';

import '../../Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'RecivingCodeNavigator.dart';

class RecivingCodeViewModel extends ChangeNotifier{

  AuthenticationRepositoryContract repositoryContract;
  late RecivingCodeNavigator navigator;
  RecivingCodeViewModel(this.repositoryContract);

  RecivingCodeFunction (String error)async{
    navigator.showLoading();

    try {
      var response = await repositoryContract.CodeCheck(error);
      navigator.hideLoading();
      navigator.showMessage("Code verified ");
      await Future.delayed(const Duration(milliseconds: 1200));
      navigator.navigate();

    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + " Error in code");
      //throw (e);
    }

  }

}