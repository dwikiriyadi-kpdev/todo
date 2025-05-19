import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('RetryExceededException', () {
    test('should set module, layer, and function correctly', () {
      final exception = RetryExceededException(
        module: 'network',
        layer: 'service',
        function: 'fetchData',
      );

      expect(exception.module, 'network');
      expect(exception.layer, 'service');
      expect(exception.function, 'fetchData');
    });

    test('code should generate the correct formatted code', () {
      final exception = RetryExceededException(
        module: 'network',
        layer: 'service',
        function: 'fetchData',
      );

      expect(exception.code, 'network-service-fetchData-RE');
    });

    test('message should return "Retry Exceeded Exception"', () {
      final exception = RetryExceededException(
        module: 'network',
        layer: 'service',
        function: 'fetchData',
      );

      expect(exception.message, 'Retry Exceeded Exception');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = RetryExceededException(
        module: 'network',
        layer: 'service',
        function: 'fetchData',
      );

      final info = exception.toInfo(
        type: ExceptionDisplayType.popup,
      );

      expect(info.title, '');
      expect(info.description, contains('Terjadi kesalahan pada proses fetchData'));
      expect(info.description, contains('RE'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('stackTrace should be set if provided', () {
      final stack = StackTrace.current;
      final exception = RetryExceededException(
        module: 'network',
        layer: 'service',
        function: 'fetchData',
        stackTrace: stack,
      );

      expect(exception.stackTrace, stack);
    });
  });
}