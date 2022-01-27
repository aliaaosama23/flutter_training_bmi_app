import 'package:bmi/Utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: const Center(
          child: Text(
            'Calculate',
            style: TextStyle(
              color: kWhiteTextColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        width: double.infinity,
        height: kButtonHeight,
        color: kButtonBackgroundColor,
      ),
    );
  }
}
