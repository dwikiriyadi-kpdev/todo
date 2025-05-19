import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:exception/exception.dart';

void main() {
  group('LocalStorageCorruptionException', () {
    test('code should return correctly formatted string', () {
      final exception = LocalStorageCorruptionException(
        module: 'storage',
        layer: 'infra',
        function: 'restore',
      );

      expect(exception.code, 'storage-infra-restore-LCR');
    });

    test('message should be "Local Storage Corruption"', () {
      final exception = LocalStorageCorruptionException(
        module: 'cache',
        layer: 'service',
        function: 'read',
      );

      expect(exception.message, 'Local Storage Corruption');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = LocalStorageCorruptionException(
        module: 'db',
        layer: 'infra',
        function: 'initBox',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('initBox'));
      expect(info.description, contains('LCR'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should match known corruption HiveError messages', () {
      final rule = LocalStorageCorruptionException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );

      final matchingMessages = [
        'Checksum of the box does not match',
        'Unexpected end of file',
        'Box contains unknown type id',
        'Corrupted or used with wrong encryption key',
        'This should not happen',
        'Invalid box header',
        'Unrecognized data format',
      ];

      for (final msg in matchingMessages) {
        expect(rule.predicate(HiveError(msg)), isTrue, reason: msg);
      }

      expect(rule.predicate(HiveError('Some unrelated error')), isFalse);
    });

    test('rule.transformer should return LocalStorageCorruptionException', () {
      final rule = LocalStorageCorruptionException.rule(
        module: 'core',
        layer: 'infra',
        function: 'openBox',
      );

      final transformed = rule.transformer(HiveError('Invalid box header'));

      expect(transformed, isA<LocalStorageCorruptionException>());
      expect((transformed as LocalStorageCorruptionException).function, 'openBox');
    });
  });
}
