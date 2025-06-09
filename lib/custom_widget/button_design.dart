import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/logic/operations/Operations_cubit.dart';

class ButtonDesign extends StatelessWidget {
  final dynamic item;
  final Color colorValue;
  final Color textValue;
  final double screenHeight;

  const ButtonDesign({
    super.key,
    required this.item,
    required this.colorValue,
    required this.textValue,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        final cubit = context.read<OperationsCubit>();
        if (item == "C") {
          cubit.clear();
        } else if (item == "+/-") {
          cubit.toggleSign();
        } else if (item is Image) {
          cubit.deleteLast();
        } else if (item == "=") {
          cubit.calculate();
        } else {
          cubit.inputValue(item);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: colorValue,
      child: item is String
          ? Text(
              item,
              style: TextStyle(
                color: textValue,
                fontSize: screenHeight * 0.028,
              ),
            )
          : item,
    );
  }
}
