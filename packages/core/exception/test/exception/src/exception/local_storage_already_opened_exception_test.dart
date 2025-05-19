import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';
import 'package:hive_ce/hive.dart';

void main() {
  group('LocalStorageAlreadyOpenedException', () {
    test('code should generate the correct formatted code', () {
      final exception = LocalStorageAlreadyOpenedException(
        module: 'storage',
        layer: 'data',
        function: 'openBox',
      );

      expect(exception.code, 'storage-data-openBox-LAO');
    });

    test('message should return correct description', () {
      final exception = LocalStorageAlreadyOpenedException(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );

      expect(exception.message, 'Local Storage Already Opened');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = LocalStorageAlreadyOpenedException(
        module: 'local',
        layer: 'infra',
        function: 'initBox',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);


      expect(info.description, contains('initBox'));
      expect(info.description, contains('LAO'));
      expect(info.type, ExceptionDisplayType.popup);
    });
    
    test('rule.transformer should return LocalStorageAlreadyOpenedException', () {
      final rule = LocalStorageAlreadyOpenedException.rule(
        module: 'core',
        layer: 'storage',
        function: 'open',
      );

      final result = rule.transformer(HiveError('Box has already been opened.'));

      expect(result, isA<LocalStorageAlreadyOpenedException>());
      expect((result as LocalStorageAlreadyOpenedException).function, 'open');
    });
  });
}
