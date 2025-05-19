import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';
import 'package:exception/src/exception/core_exception.dart';

class TestCoreException extends CoreException {
  @override
  final String module;
  @override
  final String code;
  @override
  final String layer;
  @override
  final String function;
  @override
  final String? message;
  @override
  final Object? stackTrace;

  TestCoreException({
    required this.module,
    required this.code,
    required this.layer,
    required this.function,
    this.message,
    this.stackTrace,
  });

  @override
  ExceptionInfo toInfo({String? title, required ExceptionDisplayType type}) {
    return ExceptionInfo(
      title: title ?? 'Test Error',
      description: '$message at $function [$code]',
      type: type,
    );
  }
}

void main() {
  group('CoreException', () {
    test('generatedCode should return correct formatted string', () {
      final exception = TestCoreException(
        module: 'auth',
        code: '001',
        layer: 'data',
        function: 'login',
      );

      final generated = exception.generatedCode(code: exception.code);
      expect(generated, 'auth-data-login-001');
    });

    test('toString should return message and stackTrace', () {
      final exception = TestCoreException(
        module: 'auth',
        code: '002',
        layer: 'domain',
        function: 'validate',
        message: 'Validation failed',
        stackTrace: 'StackTrace here',
      );

      final result = exception.toString();
      expect(result, contains('Validation failed'));
      expect(result, contains('StackTrace here'));
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = TestCoreException(
        module: 'payment',
        code: '003',
        layer: 'repository',
        function: 'processPayment',
        message: 'Insufficient balance',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.title, 'Test Error');
      expect(info.description, contains('Insufficient balance'));
      expect(info.type, ExceptionDisplayType.popup);
    });
  });
}
