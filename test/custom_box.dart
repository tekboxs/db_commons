import 'package:db_commons/db_commons.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'custom_box_test.g.dart';

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kDownloadsPath = 'downloadsPath';
const String kLibraryPath = 'libraryPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';
const String kExternalCachePath = 'externalCachePath';
const String kExternalStoragePath = 'externalStoragePath';

@HiveType(typeId: 2)
class TestModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  TestModel({required this.id, required this.name});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // PathProviderPlatform.instance = FakePathProviderPlatform();

  final path =
      await getApplicationDocumentsDirectory(); // Obtém o diretório temporário
  Hive.initFlutter(path.path); // Inicializa o Hive com o diretório temporário
  Hive.registerAdapter(TestModelAdapter());

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        ElevatedButton(
            onPressed: () async {
              await MealDataBaseCustom<TestModel>()
                  .addItem(TestModel(id: 212, name: '123213'));
            },
            child: Text('add')),
        ElevatedButton(
            onPressed: () async {
              final res = await MealDataBaseCustom<TestModel>().getAllItems();
              debugPrint(">>${res}");
            },
            child: Text('read'))
      ],
    );
  }
}

// class FakePathProviderPlatform extends Fake
//     with MockPlatformInterfaceMixin
//     implements PathProviderPlatform {
//   @override
//   Future<String?> getTemporaryPath() async {
//     return kTemporaryPath;
//   }

//   @override
//   Future<String?> getApplicationSupportPath() async {
//     return kApplicationSupportPath;
//   }

//   @override
//   Future<String?> getLibraryPath() async {
//     return kLibraryPath;
//   }

//   @override
//   Future<String?> getApplicationDocumentsPath() async {
//     return kApplicationDocumentsPath;
//   }

//   @override
//   Future<String?> getExternalStoragePath() async {
//     return kExternalStoragePath;
//   }

//   @override
//   Future<List<String>?> getExternalCachePaths() async {
//     return <String>[kExternalCachePath];
//   }

//   @override
//   Future<List<String>?> getExternalStoragePaths({
//     StorageDirectory? type,
//   }) async {
//     return <String>[kExternalStoragePath];
//   }

//   @override
//   Future<String?> getDownloadsPath() async {
//     return kDownloadsPath;
//   }
// }
