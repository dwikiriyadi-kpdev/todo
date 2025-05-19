import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exception/exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NoInternetConnectionException', () {
    test('code should return formatted string correctly', () {
      final exception = NoInternetConnectionException(
        module: 'core',
        layer: 'infra',
        function: 'ping',
      );

      expect(exception.code, 'core-infra-ping-NIC');
    });

    test('message should return "No Internet Connection"', () {
      final exception = NoInternetConnectionException(
        module: 'net',
        layer: 'domain',
        function: 'connect',
      );

      expect(exception.message, 'No Internet Connection');
    });

    test('toInfo should return proper ExceptionInfo', () {
      final exception = NoInternetConnectionException(
        module: 'main',
        layer: 'service',
        function: 'start',
      );

      final info = exception.toInfo(type: ExceptionDisplayType.popup);

      expect(info.description, contains('Tidak ada koneksi Internet'));
      expect(info.description, contains('NIC'));
      expect(info.type, ExceptionDisplayType.popup);
    });

    test('rule.predicate should match DioException of connectionError type', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionError,
      );

      final rule = NoInternetConnectionException.rule(
        module: 'm',
        layer: 'l',
        function: 'f',
      );

      expect(rule.predicate(dioException), isTrue);
    });

    test('rule.predicate should match SocketException', () {
      final socketException = SocketException('No internet');

      final rule = NoInternetConnectionException.rule(
        module: 'mod',
        layer: 'lay',
        function: 'func',
      );

      expect(rule.predicate(socketException), isTrue);
    });

    test('rule.transformer should return NoInternetConnectionException', () {
      final rule = NoInternetConnectionException.rule(
        module: 'a',
        layer: 'b',
        function: 'c',
      );

      final transformed = rule.transformer(SocketException(''));

      expect(transformed, isA<NoInternetConnectionException>());
      expect((transformed as NoInternetConnectionException).function, 'c');
    });
  });
}
