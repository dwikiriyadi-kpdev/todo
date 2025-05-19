import 'package:exception/exception.dart';
import 'package:exception/src/exception/core_exception.dart';

class MinimumPaymentException extends CoreException {
  MinimumPaymentException({
    required this.module,
    required this.layer,
    required this.function,
    this.response,
    this.stackTrace,
  });

  @override
  String module;

  @override
  String layer;

  @override
  String function;

  @override
  String get code => generatedCode(code: ExceptionCode.minimumPayment.code);

  @override
  String get message => "Minimum Payment Exception";

  ExceptionResponse? response;

  @override
  Object? stackTrace;

  @override
  ExceptionInfo toInfo({String? title, required ExceptionDisplayType type}) {
    return ExceptionInfo(
      title: title ?? "",
      description: "${response?.message} $function $code",
      type: type,
    );
  }
}