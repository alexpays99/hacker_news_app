import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'cache_interceptor.dart';

class ApiClient {
  static const String baseUrl = 'https://hacker-news.firebaseio.com/v0';

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      CacheInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    ]);

    return dio;
  }
}
