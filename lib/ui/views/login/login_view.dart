import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import '../../shared_widgets/custom_circular_progress_indicator.dart';
import 'login_viewmodel.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget child) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant ASD'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                _buildLoginForm(model),
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
      'Login',
      style: TextStyle(
        color: kSecondaryBlack,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  Widget _buildLoginForm(LoginViewModel model) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0, bottom: 38.0),
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
          const SizedBox(height: 24.0),
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
          const SizedBox(height: 69.0),
          FlatButton(
            onPressed: model.login,
            height: 50.0,
            color: kPrimaryRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: model.isBusy
                ? const CustomCircularProgressIndicator()
                : const Text(
                    'LOGIN',
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

  Widget _buildFooterAndRegisterButton(LoginViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Belum punya akun?',
          style: TextStyle(color: kSecondaryBlack, fontSize: 16.0),
        ),
        const SizedBox(width: 12.0),
        SizedBox(
          height: 30.0,
          child: OutlineButton(
            onPressed: model.navigateToRegisterView,
            child: const Text(
              'REGISTER',
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
