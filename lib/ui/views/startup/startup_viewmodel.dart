import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/database_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future initialize() async {
    await _databaseService.initialise();
    await _navigationService.navigateTo(Routes.loginView);
  }
}
