import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it **/
}
