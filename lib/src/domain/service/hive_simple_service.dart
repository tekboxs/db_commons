import 'package:hive/hive.dart';
import '../entities/commons_data_base_entity.dart';

///Save simple data like primitives types
class SimpleHiveService implements ISimpleDataBaseCommonsEntity {
  late Box box;
  final String boxName;
  SimpleHiveService({required this.boxName});

  _openBox() async {
    box = await Hive.openBox(boxName);
  }

  containsKey(key) async {
    await _openBox();
    print("curentKeys ${box.keys}");

    return await box.containsKey(key);
  }

  clearMemory() async {
    await _openBox();

    await box.clear();
  }

  @override
  Future deleteMethod(key) async {
    await _openBox();
    return await box.delete(key.toString());
  }

  @override
  Future readMethod(key) async {
    await _openBox();
    return await box.get(key.toString());
  }

  @override
  Future writeMethod(key, value) async {
    await _openBox();
    return await box.put(key.toString(), value);
  }
}
