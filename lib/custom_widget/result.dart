import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  final double screenHeight;
  final double screenWidth;
  final bool isDark;

  const Result({
    super.key,
    required this.result,
    required this.screenHeight,
    required this.screenWidth,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
                    height: screenHeight * 0.12,
                    width: screenWidth * 0.9,
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: screenHeight * 0.08,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  );
  }
}
