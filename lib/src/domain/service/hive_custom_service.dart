import 'package:hive/hive.dart';

import '../entities/commons_data_base_entity.dart';

///Save object like complex types
class CustomHiveService implements ICustomDataBaseCommonsEntity {
  Box box = Hive.box('customBox');

  @override
  Future deleteMethod(key) {
    // TODO: implement deleteMethod
    throw UnimplementedError();
  }

  @override
  Future readMethod(key) {
    // TODO: implement readMethod
    throw UnimplementedError();
  }

  @override
  Future writeMethod(key, value) {
    // TODO: implement writeMethod
    throw UnimplementedError();
  }
}
