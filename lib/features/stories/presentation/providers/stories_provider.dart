import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/story.dart';
import '../../data/repositories/stories_repository_impl.dart';

final storiesNotifierProvider =
    AsyncNotifierProvider<StoriesNotifier, List<Story>>(
        () => StoriesNotifier());

class StoriesNotifier extends AsyncNotifier<List<Story>> {
  @override
  Future<List<Story>> build() async {
    return _fetchStories();
  }

  Future<List<Story>> _fetchStories() async {
    try {
      final repository = ref.watch(storiesRepositoryProvider);
      final stories = await repository.getTopStories();
      return stories;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchStories());
  }
}
