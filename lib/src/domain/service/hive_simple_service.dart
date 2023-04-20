import 'package:hive/hive.dart';

///Save simple data like primitives types
class HiveSimpleService {
  final String boxName;
  late Box _box;

  HiveSimpleService({required this.boxName});

  ///open box to make possible read and update
  _init() async {
    _box = await Hive.openBox(boxName);
  }

  ///return if a key already in memory
  ///can be used to handle update or add
  Future<bool> existKey(key) async {
    await _init();
    return _box.containsKey(key);
  }

  ///remove all current data
  Future<void> clear() async {
    await _init();
    await _box.clear();
  }

  ///remove only a key
  ///have no effect if this doesnt exists
  Future deleteMethod(key) async {
    await _init();
    return await _box.delete(key.toString());
  }

  ///return stored value this service only handle
  ///[PRIMITIVES] types, if not exists return null
  Future<dynamic> readMethod(dynamic key) async {
    await _init();
    if (key is int) {
      return await _box.getAt(key);
    } else {
      return await _box.get(key);
    }
  }

  ///override a current key
  ///if not already exists may cause exception
  Future<void> writeMethod(dynamic key, dynamic value) async {
    await _init();
    if (key is int) {
      await _box.putAt(key, value);
    }
    await _box.put(key, value);
  }
}
