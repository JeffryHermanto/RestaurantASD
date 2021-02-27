import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/database_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  final isLoggedIn = false; // TODO: Implement logged in check

  Future initialize() async {
    await _databaseService.initialise();
    await _navigationService
        .navigateTo(isLoggedIn ? Routes.homeView : Routes.loginView);
  }
}
