import 'dart:io';

import 'package:exception/exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StorageFullException', () {
    test('code should be formatted correctly', () {
      final exception = StorageFullException(
        module: 'core',
        layer: 'infra',
        function: 'writeData',
      );

      expect(exception.code, 'core-infra-writeData-SF');
    });

    test('message should be "Storage Full"', () {
      final exception = StorageFullException(
        module: 'storage',
        layer: 'infra',
        function: 'saveFile',
      );

      expect(exception.message, 'Storage Full');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = StorageFullException(
        module: 'service',
        layer: 'repo',
        function: 'persist',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('persist'));
      expect(info.description, contains('SF'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should match FileSystemException with "No space left"', () {
      final rule = StorageFullException.rule(
        module: 'a',
        layer: 'b',
        function: 'c',
      );

      final fileSystemException = FileSystemException(
        'Write failed',
        '/path/to/file',
        OSError('No space left on device'),
      );

      expect(rule.predicate(fileSystemException), isTrue);
    });

    test('rule.predicate should not match FileSystemException with other message', () {
      final rule = StorageFullException.rule(
        module: 'x',
        layer: 'y',
        function: 'z',
      );

      final fileSystemException = FileSystemException(
        'Write failed',
        '/path/to/file',
        OSError('Permission denied'),
      );

      expect(rule.predicate(fileSystemException), isFalse);
    });

    test('rule.transformer should return StorageFullException', () {
      final rule = StorageFullException.rule(
        module: 'm',
        layer: 'l',
        function: 'f',
      );

      final transformed = rule.transformer(FileSystemException(
        'error',
        '/file',
        OSError('No space left on device'),
      ));

      expect(transformed, isA<StorageFullException>());
      expect((transformed as StorageFullException).function, 'f');
    });
  });
}
