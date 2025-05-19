import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('StreamUploadFailedException', () {
    test('code should return correct formatted code', () {
      final exception = StreamUploadFailedException(
        module: 'media',
        layer: 'infra',
        function: 'uploadChunk',
      );

      expect(exception.code, 'media-infra-uploadChunk-SUF');
    });

    test('message should return expected value', () {
      final exception = StreamUploadFailedException(
        module: 'upload',
        layer: 'data',
        function: 'push',
      );

      expect(exception.message, 'Stream Upload Failed Exception');
    });

    test('toInfo should return correct ExceptionInfo', () {
      final exception = StreamUploadFailedException(
        module: 'stream',
        layer: 'service',
        function: 'send',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('send'));
      expect(info.description, contains('SUF'));
      expect(info.type, ExceptionDisplayType.popup);
    });
  });
}