part of 'Login-Screen.dart';

extension ExtensionLoginController on LoginScreenState {
  void displayErrorMessage(String message) {
    ToastMessage.showMessage(message, context,
        offSetBy: 0,
        position: const StyledToastPosition(align: Alignment.topCenter, offset: 200.0),
        isShapedBorder: false);
  }

  void dismissLoadingView() {
    Navigator.pop(context);
  }

  void startShowLoadingView() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return LoadingIndicator();
      },
    );
  }

  void login() {
    if (userNameController.text.isEmpty) {
      displayErrorMessage("Username is required.");
      dismissLoadingView();
    } else if (passwordController.text.isEmpty) {
      displayErrorMessage("Password is required.");
      dismissLoadingView();
    } else if (userNameController.text.trim() != 'abc123') {
      displayErrorMessage("Username is not found.");
      dismissLoadingView();
    } else if (passwordController.text.trim() != 'qwerty') {
      displayErrorMessage("Password is incorrect.");
      dismissLoadingView();
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        dismissLoadingView(); // dissmiss loading indicator

        Navigator.of(context).push(pageRouteAnimate(const StudentListScreen()));
      });
    }
  }
}
