import 'domain/service/hive_custom_service.dart';
import 'domain/service/hive_simple_service.dart';

///responsible to store primitives types
class MealDataBase extends SimpleHiveService {
  MealDataBase({super.boxName = 'simpleCommons'});
}

///responsible to store complex data
class MealDataBaseCustom extends CustomHiveService {
  clearMemory() async {
    await box.clear();
  }
}
