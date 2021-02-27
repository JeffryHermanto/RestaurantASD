import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../enums/dialog_type.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  String _email;
  String _password;
  String _emailErrorText;
  String _passwordErrorText;
  bool _isObscured = true;

  String get email => _email;
  String get password => _password;
  String get emailErrorText => _emailErrorText;
  String get passwordErrorText => _passwordErrorText;
  bool get isObscured => _isObscured;

  void navigateBackToOnboardingView() => _navigationService.back();

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;

  void toggleShowPassword() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  Future login() async {
    if (_isEmailAndPasswordNotNullAndNotEmpty()) {}
  }

  bool _isEmailAndPasswordNotNullAndNotEmpty() {
    _setErrorTextIfNullOrEmpty();

    return _email != null &&
        _email.isNotEmpty &&
        _password != null &&
        _password.isNotEmpty;
  }

  void _setErrorTextIfNullOrEmpty() {
    if (_email == null || _email.isEmpty) {
      _emailErrorText = 'Email cannot be blank';
    }
    if (_password == null || _email.isEmpty) {
      _passwordErrorText = 'Password cannot be blank';
    }

    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _emailErrorText = null;
      _passwordErrorText = null;

      notifyListeners();
    });
  }

  // ignore: unused_element
  Future _showLoginErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Log In Failed',
      description: errorMessage,
      mainButtonTitle: 'TRY AGAIN',
    );
  }
}
