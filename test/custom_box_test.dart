import 'package:db_commons/src/db_commons.dart';
import 'package:test/test.dart';

class TestModel {}

void main() async {
  test('test name', () async {
    // await MealDataBaseCustom<TestModel>(
    //   boxName: 'productBox',
    // ).getAllItems([

    // ]);
    final memoryStorages = await MealDataBaseCustom(
          boxName: 'productBox',
        ).getAllItems() as List<TestModel>? ??
        [];
  });
}
