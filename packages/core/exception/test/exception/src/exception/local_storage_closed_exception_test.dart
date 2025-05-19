import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';
import 'package:hive_ce/hive.dart';

void main() {
  group('LocalStorageClosedException', () {
    test('code should return correctly formatted string', () {
      final exception = LocalStorageClosedException(
        module: 'core',
        layer: 'infra',
        function: 'shutdown',
      );

      expect(exception.code, 'core-infra-shutdown-LCD');
    });

    test('message should return expected string', () {
      final exception = LocalStorageClosedException(
        module: 'core',
        layer: 'infra',
        function: 'closeBox',
      );

      expect(exception.message, 'Local Storage Closed');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = LocalStorageClosedException(
        module: 'storage',
        layer: 'service',
        function: 'finalize',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('finalize'));
      expect(info.description, contains('LCD'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should match known HiveError messages', () {
      final rule = LocalStorageClosedException.rule(
        module: 'test',
        layer: 'core',
        function: 'readBox',
      );

      final matchingMessages = [
        'Box has already been closed.',
        'box has already been closed',
        'Cannot get value of a closed box.',
        'Cannot perform operation on a closed box.',
        'Cannot read from a closed box.',
      ];

      for (var msg in matchingMessages) {
        expect(rule.predicate(HiveError(msg)), isTrue, reason: msg);
      }

      expect(rule.predicate(HiveError('This is another message')), isFalse);
    });

    test('rule.transformer should return LocalStorageClosedException', () {
      final rule = LocalStorageClosedException.rule(
        module: 'core',
        layer: 'infra',
        function: 'shutdown',
      );

      final transformed = rule.transformer(HiveError('Box has already been closed.'));

      expect(transformed, isA<LocalStorageClosedException>());
      expect((transformed as LocalStorageClosedException).function, 'shutdown');
    });
  });
}
