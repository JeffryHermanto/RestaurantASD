import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import '../../shared_widgets/custom_circular_progress_indicator.dart';
import 'register_viewmodel.dart';

class RegisterView extends ViewModelBuilderWidget<RegisterViewModel> {
  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();

  @override
  Widget builder(BuildContext context, RegisterViewModel model, Widget child) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant ASD'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                _buildRegisterForm(model),
                _buildFooterAndRegisterButton(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Register',
      style: TextStyle(
        color: kSecondaryBlack,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  Widget _buildRegisterForm(RegisterViewModel model) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 38.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: kInputLabelTextStyle,
              errorText: model.emailErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: kInputLabelTextStyle,
              suffixIcon: GestureDetector(
                onTap: model.toggleShowPassword,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: model.isObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
              errorText: model.passwordErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            obscureText: model.isObscured,
            onChanged: model.updatePassword,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Nickname',
              labelStyle: kInputLabelTextStyle,
              errorText: model.nicknameErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              labelStyle: kInputLabelTextStyle,
              errorText: model.dateOfBirthErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Gender',
              labelStyle: kInputLabelTextStyle,
              errorText: model.genderErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Address',
              labelStyle: kInputLabelTextStyle,
              errorText: model.addressErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          TextField(
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Nationality',
              labelStyle: kInputLabelTextStyle,
              errorText: model.nationalityErrorText,
            ),
            cursorColor: kSecondaryGrey1,
            keyboardType: TextInputType.emailAddress,
            onChanged: model.updateEmail,
          ),
          const SizedBox(height: 36.0),
          FlatButton(
            onPressed: model.register,
            height: 50.0,
            color: kPrimaryRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: model.isBusy
                ? const CustomCircularProgressIndicator()
                : const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterAndRegisterButton(RegisterViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sudah punya akun?',
          style: TextStyle(color: kSecondaryBlack, fontSize: 16.0),
        ),
        const SizedBox(width: 12.0),
        SizedBox(
          height: 30.0,
          child: OutlineButton(
            onPressed: model.navigateBackToLoginView,
            child: const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: kSecondaryBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
