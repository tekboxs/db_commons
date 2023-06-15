import 'package:hive/hive.dart';

class HiveCustomService<T> {
  final String boxName;
  Box<T>? box;

  HiveCustomService({required this.boxName});

  ///open related type of box defined by main class
  Future<void> _init() async {
    if (box == null || !box!.isOpen) {
      box = await Hive.openBox<T>(boxName);
    }
  }

  ///add a [adapter] type in memory
  ///related by <T> on main class
  Future<int> addItem(T item) async {
    await _init();
    return await box!.add(item);
  }

  ///override a memory item by new value
  ///if item not current in memory could
  ///cause a error
  Future<void> updateItem(dynamic key, T item) async {
    // await _init();

    if (key is int) {
      await box!.putAt(key, item);
    } else {
      await box!.put(key.toString(), item);
    }
  }

  ///delete item by key or index
  ///if not exists have no effect
  Future<void> deleteItem(dynamic key) async {
    await _init();

    if (key is int) {
      await box!.deleteAt(key);
    } else {
      await box!.delete(key.toString());
    }
  }

  ///return stored value this service only handle
  ///[ADAPTERS] types, if not exists return null
  Future<T?> getItem(dynamic key) async {
    await _init();

    if (key is int) {
      return box!.getAt(key);
    } else {
      return box!.get(key.toString());
    }
  }

  ///get all [adapters] in current memory
  Future<List<T>> getAllItems() async {
    await _init();

    return box!.values.toList();
  }

  ///clear current memory
  Future<void> clear() async {
    await _init();

    await box!.clear();
  }

  Future<T?> getItemMaybe(dynamic key) async {
    await _init();

    if (key is int) {
      return box!.getAt(key);
    } else {
      return box!.get(key.toString());
    }
  }

  Future<void> close() async {
    await box?.close();
  }

  ///length of current memory by index
  int get itemCount => box!.length;
}
