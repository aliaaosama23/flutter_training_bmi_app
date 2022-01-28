import 'package:bmi/Utilities/calculator.dart';
import 'package:bmi/Utilities/constants.dart';
import 'package:bmi/custom_widgets/custom_button.dart';
import 'package:bmi/custom_widgets/gender_card_content.dart';
import 'package:bmi/custom_widgets/reusable_card.dart';
import 'package:bmi/models/result.dart';
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
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardChild: GenderCardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: GenderCardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                      cardIconAngle: 45 / 360,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: kGrayTextColor,
                    fontSize: 23,
                  ),
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
                      style: TextStyle(
                        color: kGrayTextColor,
                        fontSize: 28,
                      ),
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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          color: kGrayTextColor,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                          color: kWhiteTextColor,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'AGE',
                          style: TextStyle(
                            color: kGrayTextColor,
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            color: kWhiteTextColor,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
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
              var result = Calculator(weight, height).calculate();
              print('re is ${result.value} - tx is ${result.text}');
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
