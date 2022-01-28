import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/models/gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderCardContent extends StatelessWidget {
  const GenderCardContent({
    Key? key,
    required this.cardIcon,
    required this.genderType,
    this.cardIconAngle = 1,
  }) : super(key: key);
  final IconData cardIcon;
  final Gender genderType;
  final double? cardIconAngle;
  final Color iconAndTextColor = kGrayTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: AlwaysStoppedAnimation(cardIconAngle!),
          child: FaIcon(
            cardIcon,
            size: 80,
            color: iconAndTextColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          genderType == Gender.male ? 'MALE' : 'FEMALE',
          style: TextStyle(
            color: iconAndTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        )
      ],
    );
  }
}
