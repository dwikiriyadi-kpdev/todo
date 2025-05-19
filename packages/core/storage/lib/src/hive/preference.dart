import 'package:exception/exception.dart';
import 'package:hive_ce/hive.dart';

class Preference {
  late final Box box;

  Preference(this.box);

  static Future<Preference> init({
    required String name,
    HiveAesCipher? encryptionCipher,
  }) => openBox(
    module: "APP",
    function: "OPEN",
    call: () async {
      final box = await Hive.openBox(name, encryptionCipher: encryptionCipher);
      return Preference(box);
    },
  );
}
