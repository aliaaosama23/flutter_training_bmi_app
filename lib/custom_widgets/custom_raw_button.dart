import 'package:bmi/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRawButton extends StatelessWidget {
  const CustomRawButton({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  final VoidCallback function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(
        minHeight: 60,
        minWidth: 60,
      ),
      shape: const CircleBorder(),
      elevation: 0.0,
      onPressed: function,
      child: FaIcon(
        icon,
        size: 25,
        color: kFloatingButtonForeground,
      ),
      fillColor: kFloatingButtonBackground,
    );
  }
}
