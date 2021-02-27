import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
  String _nicknameErrorText;
  String _dateOfBirthErrorText;
  String _genderErrorText;
  String _addressErrorText;
  String _nationalityErrorText;

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
  String get nicknameErrorText => _nicknameErrorText;
  String get dateOfBirthErrorText => _dateOfBirthErrorText;
  String get genderErrorText => _genderErrorText;
  String get addressErrorText => _addressErrorText;
  String get nationalityErrorText => _nationalityErrorText;

  bool get isObscured => _isObscured;

  void navigateBackToLoginView() => _navigationService.back();

  void updateEmail(String value) => _email = value;
  void updatePassword(String value) => _password = value;
  void updateNickname(String value) => _nickname = value;
  void updateDateOfBirth(DateTime value) => _dateOfBirth = value;
  void updateGender(String value) => _gender = value;
  void updateAddress(String value) => _address = value;
  void updateNationality(String value) => _nationality = value;

  void toggleShowPassword() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  Future register() async {
    if (_isAllParamsNotNullAndNotEmpty()) {
      await _databaseService.addUser(User(
        id: 0,
        email: _email,
        password: _password,
        nickname: _nickname,
        dateOfBirth: _dateOfBirth,
        gender: _gender,
        address: _address,
        nationality: _nationality,
      ));
    }
  }

  bool _isAllParamsNotNullAndNotEmpty() {
    _setErrorTextIfNullOrEmpty();

    return _email != null &&
        _email.isNotEmpty &&
        _password != null &&
        _password.isNotEmpty &&
        _nickname != null &&
        _nickname.isNotEmpty &&
        _dateOfBirth != null &&
        _gender != null &&
        _gender.isNotEmpty &&
        _address != null &&
        _address.isNotEmpty &&
        _nationality != null &&
        _nationality.isNotEmpty;
  }

  void _setErrorTextIfNullOrEmpty() {
    if (_email == null || _email.isEmpty) {
      _emailErrorText = 'Email cannot be blank';
    }
    if (_password == null || _password.isEmpty) {
      _passwordErrorText = 'Password cannot be blank';
    }
    if (_nickname == null || _nickname.isEmpty) {
      _nicknameErrorText = 'Nickname cannot be blank';
    }
    if (_dateOfBirth == null) {
      _dateOfBirthErrorText = 'Date of birth cannot be blank';
    }
    if (_gender == null || _gender.isEmpty) {
      _genderErrorText = 'Gender cannot be blank';
    }
    if (_address == null || _address.isEmpty) {
      _addressErrorText = 'Address cannot be blank';
    }
    if (_nationality == null || _nationality.isEmpty) {
      _nationalityErrorText = 'Nationality cannot be blank';
    }

    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _emailErrorText = null;
      _passwordErrorText = null;
      _nicknameErrorText = null;
      _dateOfBirthErrorText = null;
      _genderErrorText = null;
      _addressErrorText = null;
      _nationalityErrorText = null;

      notifyListeners();
    });
  }

  // ignore: unused_element
  Future _showRegisterErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Register Failed',
      description: errorMessage,
      mainButtonTitle: 'TRY AGAIN',
    );
  }
}
