import 'package:calculator/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:calculator/logic/themes/Themes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBetweenDarkLight extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final bool isDark;

  const SwitchBetweenDarkLight({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ThemesCubit>().toggleTheme();
      },
      child: Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.2,
          decoration: BoxDecoration(
            color: AppColors.toggleButtonBackground(isDark),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                isDark
                    ? "assets/images/Dark/O_dark.png"
                    : "assets/images/sun.png",
              ),
              Image.asset(
                isDark
                    ? "assets/images/moon.png"
                    : "assets/images/Light/O_light.png",
              ),
            ],
          )),
    );
  }
}
