import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../constants.dart';
import '../shared_widgets/custom_gradient_button.dart';

class BaseCustomDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BaseCustomDialog({
    this.request,
    this.completer,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  request.title,
                  style: kDialogTitleTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  request.description,
                  style: kDialogDescriptionTextStyle,
                ),
                const SizedBox(height: 30),
                CustomGradientButton(
                  lighterColor: kPrimaryRed,
                  color: kPrimaryRed,
                  label: request.mainButtonTitle,
                  onTap: () => completer(DialogResponse(confirmed: true)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => completer(DialogResponse(confirmed: false)),
            ),
          ),
        ],
      ),
    );
  }
}
