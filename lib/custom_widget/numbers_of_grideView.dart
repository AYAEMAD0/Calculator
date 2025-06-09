import 'package:calculator/constants/color.dart';
import 'package:calculator/custom_widget/button_design.dart';
import 'package:flutter/material.dart';

class NumbersOfGrideview extends StatelessWidget {
  final num;
  final double screenHeight;
  final double screenWidth;
  final bool isDark;

  const NumbersOfGrideview({
    super.key,
    required this.num,
    required this.screenHeight,
    required this.screenWidth,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const crossAxisCount = 4;
            final itemWidth =
                (constraints.maxWidth - (8 * (crossAxisCount - 1))) /
                    crossAxisCount;
            final itemHeight = (constraints.maxHeight - (8 * 4)) / 5;
            final aspectRatio = itemWidth / itemHeight;

            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: aspectRatio,
              ),
              itemCount: num.length,
              itemBuilder: (context, index) {
                final item = num[index];
                final colorValue = index < 3
                    ? AppColors.topButtons(isDark)
                    : index % 4 == 3
                        ? AppColors.operationButton
                        : AppColors.numberButton(isDark);

                final textValue = AppColors.textColor(isDark, index);

                return ButtonDesign(
                  item: item,
                  colorValue: colorValue,
                  textValue: textValue,
                  screenHeight: screenHeight,
                );
              },
            );
          },
        ));
  }
}
