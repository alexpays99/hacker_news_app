import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/providers.dart';
import '../datasources/user_api_service.dart';
import '../models/user.dart';

part 'user_repository_impl.g.dart';

abstract class UserRepository {
  Future<User> getUser(String id);
}

class UserRepositoryImpl implements UserRepository {
  final UserApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<User> getUser(String id) async {
    final response = await _apiService.getUser(id);

    return response;
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final apiService = UserApiService(dio);
  return UserRepositoryImpl(apiService);
}
