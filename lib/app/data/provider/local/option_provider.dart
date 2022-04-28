import 'package:cannacal/app/data/model/option.dart';

class OptionProvider {
  Future<List<Option>> getAllOptions(int matrix, int point) async {
    final result = Future.value(
      Option.createNumberList(matrix, point),
    );
    Future.delayed(const Duration(seconds: 1));
    return result;
  }
}
