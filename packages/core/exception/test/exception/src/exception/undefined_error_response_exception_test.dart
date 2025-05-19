import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:exception/exception.dart';

void main() {
  group('UndefinedErrorResponseException', () {
    test('should set module, layer, function, and response correctly', () {
      final response = Response(
        data: 'Internal Server Error',
        statusCode: 500,
        requestOptions: RequestOptions(path: '/error'),
      );
      final exception = UndefinedErrorResponseException(
        module: 'core',
        layer: 'service',
        function: 'fetchData',
        response: response,
      );

      expect(exception.module, 'core');
      expect(exception.layer, 'service');
      expect(exception.function, 'fetchData');
      expect(exception.response, response);
    });

    test('code should generate the correct formatted code', () {
      final response = Response(
        data: 'Error',
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = UndefinedErrorResponseException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      expect(exception.code, 'user-repository-getUser-UER');
    });

    test('message should return "Undefined Error Response Exception"', () {
      final response = Response(
        data: 'Error',
        statusCode: 500,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = UndefinedErrorResponseException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      expect(exception.message, 'Undefined Error Response Exception');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final response = Response(
        data: 'Some error',
        statusCode: 404,
        requestOptions: RequestOptions(path: '/notfound'),
      );
      final exception = UndefinedErrorResponseException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.title, '');
      expect(info.description, contains('404'));
      expect(info.description, contains('getUser'));
      expect(info.description, contains('UER'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('stackTrace should be set if provided', () {
      final stack = StackTrace.current;
      final response = Response(
        data: 'Error',
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );
      final exception = UndefinedErrorResponseException(
        module: 'user',
        layer: 'repository',
        function: 'getUser',
        response: response,
        stackTrace: stack,
      );

      expect(exception.stackTrace, stack);
    });

    test('rule predicate should return true for DioException with non-Map data', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: 'error',
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = UndefinedErrorResponseException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      expect(rule.predicate(dioException), isTrue);
    });

    test('rule predicate should return false for DioException with Map data', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: {'message': 'error'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = UndefinedErrorResponseException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      expect(rule.predicate(dioException), isFalse);
    });

    test('rule transformer should return UndefinedErrorResponseException for DioException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          data: 'error',
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final rule = UndefinedErrorResponseException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      final result = rule.transformer(dioException);
      expect(result, isA<UndefinedErrorResponseException>());
    });

    test('rule transformer should return GeneralException for non-DioException', () {
      final rule = UndefinedErrorResponseException.rule(
        module: 'test',
        layer: 'layer',
        function: 'func',
      );
      final result = rule.transformer(Exception('other'));
      expect(result, isA<GeneralException>());
    });
  });
}