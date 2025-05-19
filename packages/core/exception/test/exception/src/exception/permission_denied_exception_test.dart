import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('PermissionDeniedException', () {
    test('code should return correct formatted string', () {
      final exception = PermissionDeniedException(
        module: 'security',
        layer: 'service',
        function: 'checkAccess',
      );

      expect(exception.code, 'security-service-checkAccess-PMD');
    });

    test('message should return "Permission Denied"', () {
      final exception = PermissionDeniedException(
        module: 'auth',
        layer: 'infra',
        function: 'validate',
      );

      expect(exception.message, 'Permission Denied');
    });

    test('toInfo should return proper ExceptionInfo', () {
      final exception = PermissionDeniedException(
        module: 'account',
        layer: 'domain',
        function: 'requestPermission',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.snackBar);

      expect(info.description, contains('requestPermission'));
      expect(info.description, contains('PMD'));
      expect(info.type, ExceptionDisplayType.snackBar);
    });
  });
}
