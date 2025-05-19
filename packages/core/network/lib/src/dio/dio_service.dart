import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/interceptors/logging_inteceptor.dart';

class DioService {
  DioService();

  Dio createClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
  }) {
    return DioBuilder(baseUrl)
        .timeOut(connectTimeout: connectTimeout, receiveTimeout: receiveTimeout)
        .addHeaders(AuthHeader.requiredApikey)
        .addInterceptor(LoggingInterceptor())
        .build();
  }
}
