import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../enums/dialog_type.dart';
import 'base_custom_dialog.dart';
import 'error_custom_dialog.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.base: (context, sheetRequest, completer) => BaseCustomDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.error: (context, sheetRequest, completer) => ErrorCustomDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
