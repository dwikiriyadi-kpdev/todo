import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('ExceptionResponse', () {
    test('fromJson and toJson should be consistent', () {
      final json = {
        'code': '400',
        'message': 'Bad Request',
        'errors': [
          {
            'code': '400-1',
            'message': 'Invalid email',
          },
          {
            'code': '400-2',
            'message': 'Password too short',
          },
        ],
      };

      final response = ExceptionResponse.fromJson(json);
      expect(response.code, equals('400'));
      expect(response.message, equals('Bad Request'));
      expect(response.errors?.length, equals(2));
      expect(response.errors?[0].code, equals('400-1'));
      expect(response.errors?[1].message, equals('Password too short'));

      final jsonOutput = response.toJson();
      expect(jsonOutput['code'], equals('400'));
      expect(jsonOutput['message'], equals('Bad Request'));
      expect(jsonOutput['errors'], isA<List>());
    });

    test('handles null fields correctly', () {
      final json = {
        'code': null,
        'message': null,
        'errors': null,
      };

      final response = ExceptionResponse.fromJson(json);
      expect(response.code, isNull);
      expect(response.message, isNull);
      expect(response.errors, isNull);

      final jsonOutput = response.toJson();
      expect(jsonOutput['code'], isNull);
      expect(jsonOutput['message'], isNull);
      expect(jsonOutput['errors'], isNull);
    });
  });
}
