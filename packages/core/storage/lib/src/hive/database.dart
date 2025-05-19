import 'package:exception/exception.dart';
import 'package:hive_ce/hive.dart';

class Database<T> {
  late final Box<T> box;

  Database(this.box);

  static Future<Database<T>> init<T>({
    required String name,
    required TypeAdapter<T> adapter,
    HiveAesCipher? encryptionCipher,
  }) => openBox(
    module: "APP",
    function: "OPEN",
    call: () async {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        Hive.registerAdapter(adapter);
      }

      final box = await Hive.openBox<T>(
        name,
        encryptionCipher: encryptionCipher,
      );
      return Database(box);
    },
  );
}
