import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
