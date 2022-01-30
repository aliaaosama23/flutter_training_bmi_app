import 'package:bmi/models/gender.dart';
import 'package:bmi/models/result.dart';
import 'dart:math';

class Calculator {
  final int weight;
  final double height;
  final int age;
  final Gender? gender;

  Calculator(this.weight, this.height, this.age, this.gender);
  Result calculate() {
    var bmi_result = 0.0;
    bmi_result = weight / pow((height / 100), 2);
    var result_text = '';

    if (bmi_result.round() < 16) {
      result_text = 'Severe Thinness';
    } else if (bmi_result.round() == 16 || bmi_result.round() < 17) {
      result_text = 'Moderate Thinness';
    } else if (bmi_result.round() == 17 || bmi_result.round() < 18.5) {
      result_text = 'Mild Thinness';
    } else if (bmi_result.round() == 18.5 || bmi_result.round() < 25) {
      result_text = 'Normal';
    } else if (bmi_result.round() == 25 || bmi_result.round() < 30) {
      result_text = 'Overweight';
    } else if (bmi_result.round() == 30 || bmi_result.round() < 35) {
      result_text = 'Obese Class I';
    } else if (bmi_result.round() == 35 || bmi_result.round() < 40) {
      result_text = 'Obese Class II';
    } else if (bmi_result.round() > 40) {
      result_text = 'Obese Class III';
    }

    return Result(value: bmi_result, text: result_text);
  }
}
