import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('MinimumPaymentException', () {
    test('code should return correct formatted string', () {
      final exception = MinimumPaymentException(
        module: 'payment',
        layer: 'validation',
        function: 'checkMinimum',
      );

      expect(exception.code, 'payment-validation-checkMinimum-MIP');
    });

    test('message should return expected text', () {
      final exception = MinimumPaymentException(
        module: 'billing',
        layer: 'service',
        function: 'verifyAmount',
      );

      expect(exception.message, 'Minimum Payment Exception');
    });

    test('toInfo should return properly formatted ExceptionInfo', () {
      final exception = MinimumPaymentException(
        module: 'checkout',
        layer: 'domain',
        function: 'processOrder',
        response: ExceptionResponse(message: 'Amount below minimum threshold'),
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('Amount below minimum threshold'));
      expect(info.description, contains('processOrder'));
      expect(info.description, contains('MIP'));
      expect(info.type, ExceptionDisplayType.popup);
    });
  });
}