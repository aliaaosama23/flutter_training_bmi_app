import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:bmi/custom_widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    Key? key,
    required this.resultText,
    required this.resultValue,
    required this.resultAdvice,
  }) : super(key: key);

  final String resultText;
  final double resultValue;
  final String resultAdvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Text(
              'Your Results',
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultValue.toStringAsFixed(1),
                    style: kResultValueTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Text(
                      resultAdvice.toString(),
                      style: const TextStyle(
                        color: kWhiteTextColor,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // save the result
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setDouble('result', resultValue);
                    },
                    child: const Text(
                      'SAVE RESULT ',
                      style: kSaveButtonTextStyle,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        kInActiveCardColor,
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomButton(
            btnText: 'Re-Calculate',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
