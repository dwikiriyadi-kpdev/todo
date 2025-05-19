import 'package:exception/exception.dart';
import 'package:exception/src/exception/core_exception.dart';

class LivenessException extends CoreException {
  LivenessException({
    required this.module,
    required this.function,
    this.stackTrace,
  });

  @override
  String module;

  @override
  String get code => generatedCode(code: ExceptionCode.liveness.code);

  @override
  String function;

  @override
  String get layer => ExceptionLayerCode.methodChannel.code;

  @override
  String? get message => "Liveness";

  @override
  Object? stackTrace;

  @override
  ExceptionInfo toInfo({String? title, required ExceptionDisplayType type}) {
    return ExceptionInfo(
      title: title ?? "",
      description: "Terjadi kesalahan pada proses $function $code",
      type: type,
    );
  }
}
