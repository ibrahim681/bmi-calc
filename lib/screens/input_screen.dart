import 'package:flutter/material.dart';
import 'package:calculator/screens/result_screen.dart';
import 'package:calculator/widgets/reuseable_card.dart';
import 'package:calculator/widgets/reuseable_column.dart';
import 'package:calculator/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/widgets/rounded_icon.button.dart';
import 'package:calculator/widgets/bottom_button.dart';

class InputScreen extends StatefulWidget{
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int num1 = 0;
  int num2 = 0;
  String operation = 'multiply';

  void calculate() {
    if (operation == 'add') {
      setState(() {
        num1 = num1 + num2;
      });
    } else if (operation == 'minus') {
      setState(() {
        num1 = num1 - num2;
      });
    } else if (operation == 'multiply') {
      setState(() {
        num1 = num1 * num2;
      });
    } else if (operation == 'divide') {
      setState(() {
        num1 = num1 ~/ num2;
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => ResultScreen(num1: num1),
      ));
  }

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
                      setState(() {
                        operation = 'add';
                      });
                    },
                    color: operation == 'add'
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.plus,
                      label: 'ADD',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      setState(() {
                        operation = 'minus';
                      });
                    },
                    color: operation == 'minus'
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.minus,
                      label: 'MINUS',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      setState(() {
                        operation = 'multiply';
                      });
                    },
                    color: operation == 'multiply'
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.xmark,
                      label: 'MULTIPLY',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onTap: () {
                      setState(() {
                        operation = 'divide';
                      });
                    },
                    color: operation == 'divide'
                        ? activeCardColour
                        : inactiveCardColour,
                    child: const ReuseableColumn(
                      icon: FontAwesomeIcons.divide,
                      label: 'DIVIDE',
                    ),
                  ),
                ),
              ],
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
                        const Text('VALUE A', style: labelTextStyle),
                        Text(
                          num1.toString(),
                          style: allTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  num1--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  num1++;
                                });
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
                        const Text('VALUE B', style: labelTextStyle),
                        Text(
                          num2.toString(),
                          style: allTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  num2--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  num2++;
                                });
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
            onTap: calculate,
          )
        ],
      ),
    );
  }
}