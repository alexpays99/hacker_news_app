import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'api_client.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return ApiClient.createDio();
}