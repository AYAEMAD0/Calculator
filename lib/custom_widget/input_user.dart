import 'package:calculator/constants/color.dart';
import 'package:flutter/material.dart';

class InputUser extends StatelessWidget {
  final String input;
  final double screenHeight;
  final double screenWidth;
  final bool isDark;

  const InputUser({
    super.key,
    required this.input,
    required this.screenHeight,
    required this.screenWidth,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.07,
      width: screenWidth * 0.9,
      alignment: Alignment.centerRight,
      child: Text(
        input,
        style: TextStyle(
          fontSize: screenHeight * 0.05,
          color: AppColors.inputTextColor(isDark),

        ),
      ),
    );
  }
}
