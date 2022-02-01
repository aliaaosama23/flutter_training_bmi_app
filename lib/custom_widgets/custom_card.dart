import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_raw_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.label,
    required this.value,
    required this.increaseValue,
    required this.decreaseValue,
  }) : super(key: key);
  final String label;
  final int value;

  final void Function(int value) increaseValue;
  final void Function(int value) decreaseValue;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.label.toString(),
          style: kLabelTextStyle,
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        Text(
          widget.value.toString(),
          style: kValueTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRawButton(
              function: () => widget.decreaseValue(widget.value),
              icon: FontAwesomeIcons.minus,
            ),
            const SizedBox(
              width: 15,
            ),
            CustomRawButton(
              function: () => widget.increaseValue(widget.value),
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}
