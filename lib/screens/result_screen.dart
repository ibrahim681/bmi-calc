import 'package:flutter/material.dart';
import 'package:calculator/utils/constants.dart';
import 'package:calculator/widgets/bottom_button.dart';
import 'package:calculator/widgets/reuseable_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.num1});

  final int num1;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
            )),
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
                          Text(widget.num1.toString(),
                              style: const TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Placeholder",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 22))
                        ],
                      )),
                )),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'AGAIN')
          ]),
    );
  }

}