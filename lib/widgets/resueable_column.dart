import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class ReuseableColumn extends StatelessWidget {
  const ReuseableColumn({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
