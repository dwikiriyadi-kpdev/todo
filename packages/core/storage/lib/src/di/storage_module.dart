import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:storage/src/hive/secure_storage.dart';
import 'package:storage/storage.dart';

Future<void> storageModule({
  required String appPreferenceName,
  required String keySecureStorage,
}) async {
  // setup hive local storage
  await Hive.initFlutter();

  // setup secure storage
  final secureStorage = SecureStorage(key: keySecureStorage);
  final hiveAesCipher = await secureStorage.generateKey();

  // setup preference
  final Preference preference = await Preference.init(
    name: appPreferenceName,
    encryptionCipher: hiveAesCipher,
  );

  // inject preference key-value
  GetIt.I.registerSingleton<Preference>(
    preference,
    instanceName: StorageQualifier.appPreference.name,
  );

  //inject secure storage for database
  GetIt.I.registerSingleton<HiveAesCipher>(hiveAesCipher);
}