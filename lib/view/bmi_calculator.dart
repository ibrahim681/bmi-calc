import 'dart:math';
class BmiCalculator {
  BmiCalculator({
    this.height,
    this.weight,
  });

  final int? height;
  final int? weight;

  double? _bmi = 0.0;

  String calculateBMI(){
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getAdvice(){
    double bmi = double.parse(calculateBMI());
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi >= 18.5 &&
        bmi < 25) {
      return 'Normal';
    } else if (bmi < 18.5) {
      return 'Underweight';
    } else {
      return 'Not sure!';
    }
  }

  String getResult(){
    double bmi = double.parse(calculateBMI());
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'You have a normal body weight. Enjoy!';
    } else if (bmi < 18.5) {
      return 'You have a lower than normal body weight. You should try to eat more!';
    } else {
      return 'i dont know';
    }
  }
}