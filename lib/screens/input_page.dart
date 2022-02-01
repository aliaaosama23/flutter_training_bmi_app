import 'package:bmi/Utilities/user_input.dart';
import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:bmi/custom_widgets/custom_card.dart';
import 'package:bmi/custom_widgets/gender_card_content.dart';
import 'package:bmi/custom_widgets/reusable_card.dart';
import 'package:bmi/models/gender.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();

    getLastResult();
  }

  getLastResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? lastResult = prefs.getDouble('result');
    print('last result was ${lastResult!.toStringAsFixed(1)}');
    Alert(
      context: context,
      title: "last result was : ",
      desc: lastResult.toStringAsFixed(1),
    ).show();
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
                        setState(() {
                          weight++;
                        });
                      },
                      decreaseValue: (myWeight) {
                        setState(() {
                          if (weight > 0) {
                            weight--;
                          }
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
                        setState(() {
                          age++;
                        });
                      },
                      decreaseValue: (myAge) {
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
              var result =
                  UserInput(weight, height, age, selectedGender).calculate();
              print('weight is $weight - height is $height ');
              print('age is $age - selectedGender is $selectedGender ');
              if (result.text != '' && result.value != 0.0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      resultValue: result.value,
                      resultText: result.text,
                      resultAdvice: result.advice,
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
