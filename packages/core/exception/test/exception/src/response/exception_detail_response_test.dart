import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('ExceptionDetailResponse', () {
    test('fromJson and toJson should be consistent', () {
      final json = {
        'parameter': 'email',
        'message': 'Invalid format',
      };

      final response = ExceptionDetailResponse.fromJson(json);
      expect(response.parameter, equals('email'));
      expect(response.message, equals('Invalid format'));

      final jsonOutput = response.toJson();
      expect(jsonOutput['parameter'], equals('email'));
      expect(jsonOutput['message'], equals('Invalid format'));
    });

    test('null values are handled correctly', () {
      final json = {
        'parameter': null,
        'message': null,
      };

      final response = ExceptionDetailResponse.fromJson(json);
      expect(response.parameter, isNull);
      expect(response.message, isNull);

      final jsonOutput = response.toJson();
      expect(jsonOutput['parameter'], isNull);
      expect(jsonOutput['message'], isNull);
    });
  });
}
