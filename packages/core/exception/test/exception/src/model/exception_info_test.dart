import 'package:flutter_test/flutter_test.dart';
import 'package:exception/exception.dart';

void main() {
  group('ExceptionInfo', () {
    test('should create instance with required parameters', () {
      // Arrange
      const description = 'Test description';
      const type = ExceptionDisplayType.popup;

      // Act
      final exceptionInfo = ExceptionInfo(
        description: description,
        type: type,
      );

      // Assert
      expect(exceptionInfo.title, equals(''));
      expect(exceptionInfo.description, equals(description));
      expect(exceptionInfo.type, equals(type));
      expect(exceptionInfo.sourceAppName, equals(''));
    });

    test('should create instance with all parameters', () {
      // Arrange
      const title = 'Test title';
      const description = 'Test description';
      const type = ExceptionDisplayType.popup;
      const sourceAppName = 'Test app';

      // Act
      final exceptionInfo = ExceptionInfo(
        title: title,
        description: description,
        type: type,
        sourceAppName: sourceAppName,
      );

      // Assert
      expect(exceptionInfo.title, equals(title));
      expect(exceptionInfo.description, equals(description));
      expect(exceptionInfo.type, equals(type));
      expect(exceptionInfo.sourceAppName, equals(sourceAppName));
    });
  });
}