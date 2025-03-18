import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/models/user.dart';

part 'user_provider.g.dart';

@riverpod
Future<User> user(UserRef ref, String userId) async {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getUser(userId);
}
