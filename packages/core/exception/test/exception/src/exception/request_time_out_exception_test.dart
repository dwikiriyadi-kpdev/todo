import 'package:dio/dio.dart';
import 'package:exception/exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RequestTimeOutException', () {
    test('code should return correct formatted string', () {
      final exception = RequestTimeOutException(
        module: 'network',
        layer: 'data',
        function: 'fetchData',
      );

      expect(exception.code, 'network-data-fetchData-RTO');
    });

    test('message should return "Request Timeout"', () {
      final exception = RequestTimeOutException(
        module: 'core',
        layer: 'infra',
        function: 'pingServer',
      );

      expect(exception.message, 'Request Timeout');
    });

    test('toInfo should return valid ExceptionInfo', () {
      final exception = RequestTimeOutException(
        module: 'main',
        layer: 'domain',
        function: 'loadInfo',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('loadInfo'));
      expect(info.description, contains('RTO'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should match DioException with receiveTimeout', () {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.receiveTimeout,
      );

      final rule = RequestTimeOutException.rule(
        module: 'mod',
        layer: 'lay',
        function: 'func',
      );

      expect(rule.predicate(exception), isTrue);
    });

    test('rule.predicate should match DioException with sendTimeout', () {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.sendTimeout,
      );

      final rule = RequestTimeOutException.rule(
        module: 'a',
        layer: 'b',
        function: 'c',
      );

      expect(rule.predicate(exception), isTrue);
    });

    test('rule.transformer should return RequestTimeOutException', () {
      final rule = RequestTimeOutException.rule(
        module: 'core',
        layer: 'infra',
        function: 'retryFetch',
      );

      final transformed = rule.transformer(DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.sendTimeout,
      ));

      expect(transformed, isA<RequestTimeOutException>());
      expect((transformed as RequestTimeOutException).function, 'retryFetch');
    });
  });
}
