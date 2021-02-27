import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import 'startup_viewmodel.dart';

/// [StartupView] will be shown right after the native splash screen
/// and will initialise everything required for the app to function.
///
/// After initialisation the ViewModel will navigate to the intended view

class StartupView extends StatelessWidget {
  const StartupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryRed),
              ),
              SizedBox(height: 24.0),
              Text('Preparing app... '),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
