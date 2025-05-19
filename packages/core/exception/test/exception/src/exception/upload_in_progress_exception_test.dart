import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('UploadInProgressException', () {
    test('should set module, layer, and function correctly', () {
      final exception = UploadInProgressException(
        module: 'media',
        layer: 'service',
        function: 'uploadFile',
      );

      expect(exception.module, 'media');
      expect(exception.layer, 'service');
      expect(exception.function, 'uploadFile');
    });

    test('code should generate the correct formatted code', () {
      final exception = UploadInProgressException(
        module: 'media',
        layer: 'service',
        function: 'uploadFile',
      );

      expect(exception.code, 'media-service-uploadFile-UIP');
    });

    test('message should return "Upload In Progress Exception"', () {
      final exception = UploadInProgressException(
        module: 'media',
        layer: 'service',
        function: 'uploadFile',
      );

      expect(exception.message, 'Upload In Progress Exception');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = UploadInProgressException(
        module: 'media',
        layer: 'service',
        function: 'uploadFile',
      );

      final info = exception.toInfo(
        type: ExceptionDisplayType.popup,
      );

      expect(info.title, '');
      expect(info.description, contains('Terjadi kesalahan pada proses uploadFile'));
      expect(info.description, contains('UIP'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('stackTrace should be set if provided', () {
      final stack = StackTrace.current;
      final exception = UploadInProgressException(
        module: 'media',
        layer: 'service',
        function: 'uploadFile',
        stackTrace: stack,
      );

      expect(exception.stackTrace, stack);
    });
  });
}