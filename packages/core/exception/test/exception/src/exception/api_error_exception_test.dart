import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:exception/exception.dart';

void main() {
  group('ApiErrorException', () {
    test('should set module, layer, function, and response correctly', () {
      final response = Response(
        data: {'message': 'Invalid token'},
        statusCode: 401,
        requestOptions: RequestOptions(path: '/login'),
      );
      final exception = ApiErrorException(
        module: 'auth',
        layer: 'service',
        function: 'login',
        response: response,
      );

      expect(exception.module, 'auth');
      expect(exception.layer, 'service');
      expect(exception.function, 'login');
      expect(exception.response, response);
    });

    test('code should generate the correct formatted code', () {
      final response = Response(
        data: {},
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = ApiErrorException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      expect(exception.code, 'user-repository-getUser-AE');
    });

    test('message should return "API Error Exception"', () {
      final response = Response(
        data: {},
        statusCode: 500,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = ApiErrorException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      expect(exception.message, 'API Error Exception');
    });

    test('serialized should parse response data', () {
      final response = Response(
        data: {'message': 'Not found'},
        statusCode: 404,
        requestOptions: RequestOptions(path: '/notfound'),
      );
      final exception = ApiErrorException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      final serialized = exception.serialized();
      expect(serialized.message, 'Not found');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final response = Response(
        data: {'message': 'Unauthorized'},
        statusCode: 401,
        requestOptions: RequestOptions(path: '/login'),
      );
      final exception = ApiErrorException(
        module: 'auth',
        layer: 'service',
        function: 'login',
        response: response,
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.title, '');
      expect(info.description, contains('401'));
      expect(info.description, contains('Unauthorized'));
      expect(info.description, contains('login'));
      expect(info.description, contains('AE'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('stackTrace should be set if provided', () {
      final stack = StackTrace.current;
      final response = Response(
        data: {},
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = ApiErrorException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
        stackTrace: stack,
      );

      expect(exception.stackTrace, stack);
    });

    test('rule predicate should return true for DioException with Map data', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: {'message': 'error'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = ApiErrorException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      expect(rule.predicate(dioException), isTrue);
    });

    test('rule predicate should return false for DioException with non-Map data', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: 'error',
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = ApiErrorException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      expect(rule.predicate(dioException), isFalse);
    });

    test('rule transformer should return ApiErrorException for DioException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: {'message': 'error'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = ApiErrorException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      final result = rule.transformer(dioException);
      expect(result, isA<ApiErrorException>());
    });

    test('rule transformer should return GeneralException for non-DioException', () {
      final rule = ApiErrorException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      final result = rule.transformer(Exception('other'));
      expect(result, isA<GeneralException>());
    });
  });
}