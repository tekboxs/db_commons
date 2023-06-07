import 'package:hive/hive.dart';

class HiveCustomService<T> {
  final String boxName;
  late Box<T> _box;

  HiveCustomService({required this.boxName});

  ///open related type of box defined by main class
  Future<void> _init() async {
    await Hive.openBox<T>(boxName);
    _box = Hive.box<T>(boxName);
  }

  ///add a [adapter] type in memory
  ///related by <T> on main class
  Future<int> addItem(T item) async {
    await _init();
    return await _box.add(item);
  }

  ///override a memory item by new value
  ///if item not current in memory could
  ///cause a error
  Future<void> updateItem(dynamic key, T item) async {
    await _init();

    if (key is int) {
      await _box.putAt(key, item);
    } else {
      await _box.put(key.toString(), item);
    }
  }

  ///delete item by key or index
  ///if not exists have no effect
  Future<void> deleteItem(dynamic key) async {
    await _init();

    if (key is int) {
      await _box.deleteAt(key);
    } else {
      await _box.delete(key.toString());
    }
  }

  ///return stored value this service only handle
  ///[ADAPTERS] types, if not exists return null
  Future<T?> getItem(dynamic key) async {
    await _init();

    if (key is int) {
      return _box.getAt(key);
    } else {
      return _box.get(key.toString());
    }
  }

  ///get all [adapters] in current memory
  Future<List<T>> getAllItems() async {
    await _init();

    return _box.values.toList();
  }

  ///clear current memory
  Future<void> clear() async {
    await _init();

    await _box.clear();
  }

  ///length of current memory by index
  int get itemCount => _box.length;
}
