import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('MaximumLimitException', () {
    test('code should return correct formatted code', () {
      final exception = MaximumLimitException(
        module: 'auth',
        layer: 'service',
        function: 'submit',
      );

      expect(exception.code, 'auth-service-submit-MAL');
    });

    test('message should return "Maximum Limit Exception"', () {
      final exception = MaximumLimitException(
        module: 'core',
        layer: 'infra',
        function: 'check',
      );

      expect(exception.message, 'Maximum Limit Exception');
    });

    test('toInfo should return ExceptionInfo with response message', () {
      final exception = MaximumLimitException(
        module: 'quota',
        layer: 'api',
        function: 'limitCheck',
        response: ExceptionResponse(message: 'Limit exceeded'),
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('Limit exceeded'));
      expect(info.description, contains('limitCheck'));
      expect(info.description, contains('MAL'));
      expect(info.type, ExceptionDisplayType.popup);
    });
  });
}
