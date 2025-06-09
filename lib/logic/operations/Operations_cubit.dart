import 'package:calculator/logic/operations/Operations_State_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class OperationsCubit extends Cubit<InitalOperations> {
  OperationsCubit() : super(InitalOperations());

  void inputValue(String value) {
    final newInput = state.input + value;
    emit(InitalOperations(input: newInput, result: state.result));
  }

  void clear() {
    emit(InitalOperations());
  }

  void toggleSign() {
    String newInput = state.input;
    if (newInput.startsWith("-")) {
      newInput = newInput.substring(1);
    } else {
      newInput = "-$newInput";
    }
    emit(InitalOperations(input: newInput, result: state.result));
  }

  void deleteLast() {
    if (state.input.isEmpty) return;
    String newInput = state.input.substring(0, state.input.length - 1);
    String newResult = "0";

    if (newInput.isNotEmpty) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(newInput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);

        newResult = _formatResult(eval);
      } catch (e) {
        newResult = " ";
      }
    }

    emit(InitalOperations(input: newInput, result: newResult));
  }

  void calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(state.input);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      String result = _formatResult(eval);

      emit(InitalOperations(input: state.input, result: result));
    } catch (e) {
      emit(InitalOperations(input: state.input, result: " "));
    }
  }

  String _formatResult(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString(); 
    } else {
      return value.toString();
    }
  }
}
