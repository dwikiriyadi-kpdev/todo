import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('GeneralException', () {
    test('code should generate correct formatted code', () {
      final exception = GeneralException(
        module: 'core',
        layer: 'usecase',
        function: 'execute',
      );

      expect(exception.code, 'core-usecase-execute-GEN');
    });

    test('message should be "General Exception"', () {
      final exception = GeneralException(
        module: 'auth',
        layer: 'repository',
        function: 'saveToken',
      );

      expect(exception.message, 'General Exception');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = GeneralException(
        module: 'payment',
        layer: 'service',
        function: 'process',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('process'));
      expect(info.description, contains('GEN'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should always return true', () {
      final rule = GeneralException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );

      expect(rule.predicate(Exception()), isTrue);
      expect(rule.predicate(FormatException()), isTrue);
    });

    test('rule.transformer should return GeneralException', () {
      final rule = GeneralException.rule(
        module: 'mod',
        layer: 'lay',
        function: 'func',
      );

      final result = rule.transformer(Exception());

      expect(result, isA<GeneralException>());
      expect((result as GeneralException).function, 'func');
    });
  });
}
