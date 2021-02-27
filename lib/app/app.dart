import 'package:stacked/stacked_annotations.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it **/
}
