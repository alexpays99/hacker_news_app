import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  final _cache = <String, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cachedResponse = _cache[options.uri.toString()];
    if (cachedResponse != null) {
      return handler.resolve(cachedResponse);
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri.toString()] = response;
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}