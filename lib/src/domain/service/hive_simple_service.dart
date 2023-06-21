import 'package:hive/hive.dart';

///Save simple data like primitives types
class HiveSimpleService {
  final String boxName;
  Box? box;

  HiveSimpleService({required this.boxName});

  ///open box to make possible read and update
  _init() async {
    if (box == null || !box!.isOpen) {
      box = await Hive.openBox(boxName);
    }
  }

  ///return if a key already in memory
  ///can be used to handle update or add
  Future<bool> existKey(dynamic key) async {
    await _init();
    return box!.containsKey(key.toString());
  }

  ///remove all current data
  Future<void> clear() async {
    await _init();
    await box!.clear();
  }

  ///remove only a key
  ///have no effect if this doesnt exists
  Future deleteMethod(key) async {
    await _init();
    return await box!.delete(key.toString());
  }

  ///return stored value this service only handle
  ///[PRIMITIVES] types, if not exists return null
  Future<dynamic> readMethod(dynamic key) async {
    await _init();
    if (key is int) {
      return await box!.getAt(key);
    } else {
      return await box!.get(key.toString());
    }
  }

  ///override a current key
  ///if not already exists may cause exception
  Future<void> writeMethod(dynamic key, dynamic value) async {
    await _init();
    if (key is int) {
      await box!.putAt(key, value);
    }
    await box!.put(key.toString(), value);
  }

  Future<int> get memoryLength async {
    await _init();
    return box!.length;
  }

  Future<List<dynamic>> get getAllItens async {
    await _init();
    return [for (var key in box!.keys) await readMethod(key)];
  }
}
