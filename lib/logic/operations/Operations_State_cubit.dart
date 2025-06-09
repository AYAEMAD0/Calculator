abstract class OperationsState {}

class InitalOperations extends OperationsState {
  final String result;
  final String input;

  InitalOperations({this.input = "", this.result = "0"});
}
