import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('ExceptionCode', () {
    test('should have correct code values', () {
      // Common
      expect(ExceptionCode.general.code, equals('GEN'));
      expect(ExceptionCode.decodeFailed.code, equals('DF'));

      // Local Storage & File System
      expect(ExceptionCode.localStorageCorruption.code, equals('LCR'));
      expect(ExceptionCode.localStorageAlreadyOpened.code, equals('LAO'));
      expect(ExceptionCode.localStorageClosed.code, equals('LCD'));
      expect(ExceptionCode.readOnlyFileSystem.code, equals('ROF'));
      expect(ExceptionCode.storageFull.code, equals('SF'));

      // Network
      expect(ExceptionCode.noInternetConnection.code, equals('NIC'));
      expect(ExceptionCode.requestTimeOut.code, equals('RTO'));
      expect(ExceptionCode.pollingTimeOut.code, equals('PTO'));
      expect(ExceptionCode.retryExceeded.code, equals('RE'));

      // Server
      expect(ExceptionCode.apiError.code, equals('AE'));
      expect(ExceptionCode.undefinedErrorResponse.code, equals('UER'));

      // Media
      expect(ExceptionCode.streamUploadFailed.code, equals('SUF'));
      expect(ExceptionCode.uploadInProgress.code, equals('UIP'));

      // Limit
      expect(ExceptionCode.maximumLimit.code, equals('MAL'));
      expect(ExceptionCode.minimumPayment.code, equals('MIP'));
      expect(ExceptionCode.maximumPayment.code, equals('MAP'));

      // Liveness
      expect(ExceptionCode.liveness.code, equals('LVN'));

      // Permission
      expect(ExceptionCode.permissionDenied.code, equals('PMD'));
    });
  });
}