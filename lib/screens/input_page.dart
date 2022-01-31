import 'package:bmi/Utilities/calculator.dart';
import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:bmi/custom_widgets/gender_card_content.dart';
import 'package:bmi/custom_widgets/reusable_card.dart';
import 'package:bmi/models/gender.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 100.0;
  int weight = 50;
  int age = 20;
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  bool selectMale = false;
  bool selectFemale = false;
  Gender? selectedGender;

  chooseGender(Gender gender) {
    selectedGender = gender;
    setState(() {
      if (gender == Gender.male) {
        selectMale = true;
        selectFemale = false;
        if (maleCardColor == kInActiveCardColor) {
          maleCardColor = kActiveCardColor;
        } else {
          maleCardColor = kInActiveCardColor;
          femaleCardColor = kActiveCardColor;
        }
      } else {
        selectMale = false;
        selectFemale = true;
        if (femaleCardColor == kInActiveCardColor) {
          femaleCardColor = kActiveCardColor;
        } else {
          femaleCardColor = kInActiveCardColor;
          maleCardColor = kActiveCardColor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () => chooseGender(Gender.male),
                    cardColor: maleCardColor,
                    cardChild: GenderCardContent(
                      selected: selectMale,
                      cardIcon: FontAwesomeIcons.mars,
                      genderType: Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => chooseGender(Gender.female),
                    cardColor: femaleCardColor,
                    cardChild: GenderCardContent(
                      selected: selectFemale,
                      cardIcon: FontAwesomeIcons.venus,
                      genderType: Gender.female,
                      cardIconAngle: 45 / 360,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kValueTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kUnitTextStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 20,
                    ),
                  ),
                  child: Slider(
                    activeColor: kGrayTextColor,
                    thumbColor: kButtonBackgroundColor,
                    inactiveColor: kGrayTextColor1,
                    value: height,
                    max: 200,
                    min: 0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round().toDouble();
                        // print(value.toInt().toString());
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: CustomCard(
                      label: 'WEIGHT',
                      value: weight,
                      increaseValue: (myWeight) {
                        print('current weight is $weight');
                        setState(() {
                          weight++;
                        });
                      },
                      decreaseValue: (myWeight) {
                        print('current weight is $weight');
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: CustomCard(
                      label: 'AGE',
                      value: age,
                      increaseValue: (myAge) {
                        print('current age is $age');
                        setState(() {
                          age++;
                        });
                      },
                      decreaseValue: (myAge) {
                        print('current age is $age');
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            btnText: 'Calculate',
            onPress: () {
              print('selected gender $selectedGender');
              print('age is $age - weight is $weight -height is $height');
              var result =
                  Calculator(weight, height, age, selectedGender).calculate();
              if (result.text != '' && result.value != 0.0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      result: result.value,
                      resultText: result.text,
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

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
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.value.toString(),
          style: kValueTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              constraints: const BoxConstraints(
                minHeight: 60,
                minWidth: 60,
              ),
              shape: const CircleBorder(),
              elevation: 0.0,
              onPressed: () => widget.decreaseValue,
              child: const FaIcon(
                FontAwesomeIcons.minus,
                size: 25,
                color: kFloatingButtonForeground,
              ),
              fillColor: kFloatingButtonBackground,
            ),
            const SizedBox(
              width: 15,
            ),
            RawMaterialButton(
              constraints: const BoxConstraints(
                minHeight: 60,
                minWidth: 60,
              ),
              shape: const CircleBorder(),
              elevation: 0.0,
              onPressed: () => widget.increaseValue,
              child: const FaIcon(
                FontAwesomeIcons.plus,
                size: 25,
                color: kFloatingButtonForeground,
              ),
              fillColor: kFloatingButtonBackground,
            ),
          ],
        )
      ],
    );
  }
}
