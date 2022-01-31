import 'package:bmi/models/gender.dart';
import 'package:bmi/models/result.dart';
import 'dart:math';

class UserInput {
  final int weight;
  final double height;
  final int age;
  final Gender? gender;

  UserInput(this.weight, this.height, this.age, [this.gender]);
  Result calculate() {
    var bmi_result = 0.0;
    bmi_result = weight / pow((height / 100), 2);
    var resultText = '';
    var resultAdvice = '';

    if (bmi_result.round() < 16) {
      resultText = 'Severe Thinness';
    } else if (bmi_result.round() == 16 || bmi_result.round() < 17) {
      resultText = 'Moderate Thinness';
    } else if (bmi_result.round() == 17 || bmi_result.round() < 18.5) {
      resultText = 'Mild Thinness';
    } else if (bmi_result.round() == 18.5 || bmi_result.round() < 25) {
      resultText = 'Normal';
    } else if (bmi_result.round() == 25 || bmi_result.round() < 30) {
      resultText = 'Overweight';
    } else if (bmi_result.round() == 30 || bmi_result.round() < 35) {
      resultText = 'Obese Class I';
    } else if (bmi_result.round() == 35 || bmi_result.round() < 40) {
      resultText = 'Obese Class II';
    } else if (bmi_result.round() > 40) {
      resultText = 'Obese Class III';
    }
    resultAdvice = 'take care of your food as your result is $resultText';

    return Result(
      value: bmi_result,
      text: resultText,
      advice: resultAdvice,
    );
  }
}
