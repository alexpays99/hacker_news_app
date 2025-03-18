import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/stories/presentation/screens/stories_screen.dart';
import '../../features/user/presentation/screens/user_screen.dart';
import 'custom_page_transition.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'stories',
        pageBuilder: (context, state) => const CustomPageTransition(
          child: StoriesScreen(),
        ),
      ),
      GoRoute(
        path: '/user/:id',
        name: 'user',
        pageBuilder: (context, state) {
          final userId = state.params['id']!;
          return CustomPageTransition(
            child: UserScreen(userId: userId),
          );
        },
      ),
    ],
  );
}
