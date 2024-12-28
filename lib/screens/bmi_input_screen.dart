import 'package:bmi/utils/enum.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widgets/resueable_card.dart';
import 'package:bmi/widgets/resueable_column.dart';
import 'package:bmi/widgets/bottom_button.dart';
import 'package:bmi/widgets/rounded_icon.button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  MyGender selectedGender = MyGender.nonBinary;
  int heightNum = 180;
  int weightNum = 60;
  int ageNum = 20;

  // void calculateBmi() {
  //   setState(() {});

  //   BmiCalculator calc = BmiCalculator(
  //     height: heightNum,
  //     weight: weightNum,
  //   );

  //   final bmi = calc.calculateBMI();
  //   final advice = calc.getAdvice();
  //   final answer = calc.getResult();

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return BMIResultScreen(
  //           ansText: bmi,
  //           ansResult: answer,
  //           ansAdvice: advice,
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      selectedGender = MyGender.male;

                      setState(() {});
                    },
                    color: selectedGender == MyGender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.mars,
                      label: 'XY',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = MyGender.female;
                      });
                    },
                    color: selectedGender == MyGender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.venus,
                      label: 'XX',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = MyGender.nonBinary;
                      });
                    },
                    color: selectedGender == MyGender.nonBinary
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.heartPulse,
                      label: 'N/A',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: activeCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        heightNum.toString(),
                        style: allTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFFEB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: heightNum.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newVal) {
                        setState(() {
                          heightNum = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),
                        Text(
                          weightNum.toString(),
                          style: allTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                if (ageNum > 1) {
                                  setState(() {
                                    weightNum--;
                                  });
                                } else {
                                  // const SnackBar(
                                  //   content: Text('Age cannot be less than 1'),
                                  // );
                                }
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                if (ageNum < 100) {
                                  setState(() {
                                    weightNum++;
                                  });
                                } else {
                                  // const SnackBar(
                                  //   content: Text('Age cannot be greater than 100'),
                                  // );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: labelTextStyle),
                        Text(
                          ageNum.toString(),
                          style: allTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                if (ageNum > 1) {
                                  setState(() {
                                    ageNum--;
                                  });
                                } else {
                                  // const SnackBar(
                                  //   content: Text('Age cannot be less than 1'),
                                  // );
                                }
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                if (ageNum < 10) {
                                  setState(() {
                                    ageNum++;
                                  });
                                } else {
                                  // const SnackBar(
                                  //   content: Text('Age cannot be greater than 100'),
                                  // );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () => {
              print("okay"),
            }),
        ],
      ),
    );
  }
}
