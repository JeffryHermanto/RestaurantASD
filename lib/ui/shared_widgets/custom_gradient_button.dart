import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String label;
  final Color lighterColor;
  final Color color;
  final Function onTap;
  final bool busy;

  const CustomGradientButton({
    @required this.label,
    @required this.lighterColor,
    @required this.color,
    @required this.onTap,
    this.busy = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [lighterColor, color],
          )),
          child: InkWell(
            onTap: () => onTap(),
            child: Container(
              height: 42.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _buildCenterLabel(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenterLabel() {
    return Center(
      child: busy
          ? const SizedBox(
              width: 15.0,
              height: 15.0,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
}
