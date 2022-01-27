import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:bmi/custom_widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    Key? key,
    required this.resultText,
    required this.result,
  }) : super(key: key);

  final String resultText;
  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Text(
              'Your Results',
              style: TextStyle(
                fontSize: 40,
                color: kWhiteTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      color: kGreenTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    result.toStringAsFixed(1),
                    style: const TextStyle(
                      color: kWhiteTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      letterSpacing: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Text(
                      'You have a normal body weight ',
                      style: TextStyle(
                        color: kWhiteTextColor,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // save the result
                    },
                    child: const Text(
                      'SAVE RESULT',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
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
