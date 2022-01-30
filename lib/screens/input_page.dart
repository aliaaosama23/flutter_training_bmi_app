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
                      style: const TextStyle(
                        color: kWhiteTextColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kValueTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            shape: const CircleBorder(),
                            elevation: 0.0,
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: FaIcon(
                                FontAwesomeIcons.minus,
                                size: 25,
                                color: kFloatingButtonForeground,
                              ),
                            ),
                            fillColor: kFloatingButtonBackground,
                          ),
                          RawMaterialButton(
                            shape: const CircleBorder(),
                            elevation: 0.0,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 25,
                                color: kFloatingButtonForeground,
                              ),
                            ),
                            fillColor: kFloatingButtonBackground,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
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
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kValueTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              shape: const CircleBorder(),
                              elevation: 0.0,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 25,
                                  color: kFloatingButtonForeground,
                                ),
                              ),
                              fillColor: kFloatingButtonBackground,
                            ),
                            RawMaterialButton(
                              shape: const CircleBorder(),
                              elevation: 0.0,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 25,
                                  color: kFloatingButtonForeground,
                                ),
                              ),
                              fillColor: kFloatingButtonBackground,
                            ),
                          ],
                        )
                      ],
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
              var result =
                  Calculator(weight, height, age, selectedGender!).calculate();
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
