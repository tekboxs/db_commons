import 'domain/service/hive_custom_service.dart';
import 'domain/service/hive_simple_service.dart';

///responsible to store primitives types
class MealDataBase extends HiveSimpleService {
  MealDataBase({super.boxName = 'simpleCommons'});
}

///responsible to store complex data
class MealDataBaseCustom<T> extends HiveCustomService {
  MealDataBaseCustom({super.boxName = 'customCommons'});
}
