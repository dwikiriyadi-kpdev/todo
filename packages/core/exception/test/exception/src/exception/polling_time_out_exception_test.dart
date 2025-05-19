import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('PollingTimeOutException', () {
    test('code should return correctly formatted code', () {
      final exception = PollingTimeOutException(
        module: 'sync',
        layer: 'infra',
        function: 'waitForResult',
      );

      expect(exception.code, 'sync-infra-waitForResult-PTO');
    });

    test('message should return expected string', () {
      final exception = PollingTimeOutException(
        module: 'network',
        layer: 'service',
        function: 'poll',
      );

      expect(exception.message, 'Polling Timeout Exception');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = PollingTimeOutException(
        module: 'core',
        layer: 'domain',
        function: 'startPolling',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('startPolling'));
      expect(info.description, contains('PTO'));
      expect(info.type, ExceptionDisplayType.popup);
    });
  });
}