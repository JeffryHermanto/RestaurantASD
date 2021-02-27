import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../datamodels/user.dart';
import '../../../enums/dialog_type.dart';
import '../../../services/database_service.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  String _email;
  String _password;
  String _nickname;
  DateTime _dateOfBirth;
  String _gender;
  String _address;
  String _nationality;
  String _emailErrorText;
  String _passwordErrorText;
  bool _isObscured = true;

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;
  DateTime get dateOfBirth => _dateOfBirth;
  String get gender => _gender;
  String get address => _address;
  String get nationality => _nationality;
  String get emailErrorText => _emailErrorText;
  String get passwordErrorText => _passwordErrorText;
  bool get isObscured => _isObscured;

  void navigateBackToLoginView() => _navigationService.back();

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;
  void updateNickname(String value) => _nickname = value;
  void updateDateOfBirth(DateTime value) => _dateOfBirth = value;
  void updateGender(String value) => _gender = value;
  void updateAddress(String value) => _address = value;
  void updateNationality(String value) => _nationality = value;

  void clearForm() {
    _email = null;
    _password = null;
    _nickname = null;
    _dateOfBirth = null;
    _gender = null;
    _address = null;
    _nationality = null;
    _emailErrorText = null;
    _passwordErrorText = null;
    _isObscured = true;

    notifyListeners();
  }

  void toggleShowPassword() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  Future register() async {
    if (_isEmailAndPasswordNotNullAndNotEmpty()) {
      final response = await _databaseService.addUser(User(
        id: Uuid().v1(),
        email: _email,
        password: _password,
        nickname: _nickname,
        dateOfBirth: _dateOfBirth,
        gender: _gender,
        address: _address,
        nationality: _nationality,
      ));

      response.fold(
        (exception) => _showRegisterErrorDialog(exception.toString()),
        (unit) => _showRegisterSuccessDialog(),
      );
    }
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
    if (_password == null || _password.isEmpty) {
      _passwordErrorText = 'Password cannot be blank';
    }

    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _emailErrorText = null;
      _passwordErrorText = null;

      notifyListeners();
    });
  }

  Future _showRegisterSuccessDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Register Success',
      description: 'You are registered!',
      mainButtonTitle: 'PLEASE SIGN IN',
    );

    _navigationService.back();
  }

  Future _showRegisterErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Register Failed',
      description: errorMessage,
      mainButtonTitle: 'TRY AGAIN',
    );
  }
}
