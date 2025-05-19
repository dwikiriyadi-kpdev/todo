import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('DecodeFailedException', () {
    test('code should generate correct formatted code', () {
      final exception = DecodeFailedException(
        module: 'data',
        layer: 'mapper',
        function: 'fromJson',
      );

      expect(exception.code, 'data-mapper-fromJson-DF');
    });

    test('message should match expected description', () {
      final exception = DecodeFailedException(
        module: 'app',
        layer: 'parser',
        function: 'parseInput',
      );

      expect(exception.message, 'Failed encode/decode - Mismatched Type');
    });

    test('toInfo should return a well-formed ExceptionInfo', () {
      final exception = DecodeFailedException(
        module: 'network',
        layer: 'serializer',
        function: 'deserialize',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.snackBar);

      expect(info.description, contains('enkoding/dekoding'));
      expect(info.description, contains('deserialize'));
      expect(info.description, contains('DF'));
    });

    test('rule should match known acceptable exceptions', () {
      final rule = DecodeFailedException.rule(
        module: 'test',
        layer: 'layer',
        function: 'function',
      );

      expect(rule.predicate(FormatException()), isTrue);
      expect(rule.predicate(TypeError()), isTrue);
      expect(rule.predicate(ArgumentError()), isFalse);
    });

    test('rule.transformer should return DecodeFailedException', () {
      final rule = DecodeFailedException.rule(
        module: 'decode',
        layer: 'layer',
        function: 'func',
      );

      final transformed = rule.transformer(FormatException());

      expect(transformed, isA<DecodeFailedException>());
      expect((transformed as DecodeFailedException).function, 'func');
    });
  });
}
