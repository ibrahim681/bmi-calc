import 'package:flutter/material.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/widgets/bottom_button.dart';
import 'package:bmi/widgets/resueable_card.dart';

class BMIResultScreen extends StatefulWidget{
  const BMIResultScreen({
    required this.ansResult,
    required this.ansText,
    required this.ansAdvice,
    super.key,
  });

  final String ansResult;
  final String ansText;
  final String ansAdvice;

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              color: activeCardColour,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.ansResult.toUpperCase(),
                      style: resultStyle
                    ),
                    Text(
                      widget.ansText,
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                      widget.ansAdvice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22
                      )
                    )
                  ],
                )
              ),
            )
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          }, 
            buttonTitle: 'RE-CALCULATE'
          )
        ]
      ),
    );
  }

}