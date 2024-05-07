abstract class ReceivingCodeNavigator {
  void showLoading();

  void hideLoading();

  void showMessage(
    String message, {
    String? posActionTitle,
    String? negActionTitle,
    void Function()? posAction,
    void Function()? negAction,
    bool isDismissible = true,
  });
}
