import 'package:exception/exception.dart';
import 'package:exception/src/exception/core_exception.dart';

class MaximumPaymentException extends CoreException {
  MaximumPaymentException({
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
  String get code => generatedCode(code: ExceptionCode.maximumPayment.code);

  @override
  String get message => "Maximum Payment Exception";

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