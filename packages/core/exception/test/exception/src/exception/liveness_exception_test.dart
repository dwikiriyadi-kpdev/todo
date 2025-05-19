import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('LivenessException', () {
    test('code should generate correct formatted code', () {
      final exception = LivenessException(
        module: 'biometrics',
        function: 'detectFace',
      );

      expect(exception.code, 'biometrics-MC-detectFace-LVN');
    });

    test('message should return "Liveness"', () {
      final exception = LivenessException(
        module: 'auth',
        function: 'checkLiveness',
      );

      expect(exception.message, 'Liveness');
    });

    test('layer should be "methodChannel"', () {
      final exception = LivenessException(
        module: 'security',
        function: 'validateSession',
      );

      expect(exception.layer, 'MC');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = LivenessException(
        module: 'camera',
        function: 'startCapture',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.snackBar);

      expect(info.description, contains('startCapture'));
      expect(info.description, contains('LV'));
      expect(info.type, ExceptionDisplayType.snackBar);
    });
  });
}
