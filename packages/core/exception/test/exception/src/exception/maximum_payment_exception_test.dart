import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('MaximumPaymentException', () {
    test('code should generate the correct formatted code', () {
      final exception = MaximumPaymentException(
        module: 'payment',
        layer: 'service',
        function: 'processPayment',
      );

      expect(exception.code, 'payment-service-processPayment-MAP');
    });

    test('message should return "Maximum Payment Exception"', () {
      final exception = MaximumPaymentException(
        module: 'payment',
        layer: 'repository',
        function: 'checkLimit',
      );

      expect(exception.message, 'Maximum Payment Exception');
    });

    test('layer, module, and function should be set correctly', () {
      final exception = MaximumPaymentException(
        module: 'order',
        layer: 'controller',
        function: 'submitOrder',
      );

      expect(exception.module, 'order');
      expect(exception.layer, 'controller');
      expect(exception.function, 'submitOrder');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = MaximumPaymentException(
        module: 'core',
        layer: 'service',
        function: 'validateMax',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('validateMax'));
      expect(info.description, contains('MAP'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('toInfo should include response message if provided', () {
      final response = ExceptionResponse(message: 'Limit exceeded');
      final exception = MaximumPaymentException(
        module: 'core',
        layer: 'service',
        function: 'validateMax',
        response: response,
      );

      final info = exception.toInfo(type: ExceptionDisplayType.snackBar);

      expect(info.description, contains('Limit exceeded'));
      expect(info.description, contains('validateMax'));
      expect(info.description, contains('MAP'));
      expect(info.type, ExceptionDisplayType.snackBar);
    });
  });
}
