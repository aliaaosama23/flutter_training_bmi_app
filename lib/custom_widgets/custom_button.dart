import 'package:bmi/Utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPress, required this.btnText})
      : super(key: key);

  final VoidCallback onPress;

  final String btnText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            btnText.toString(),
            style: const TextStyle(
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
