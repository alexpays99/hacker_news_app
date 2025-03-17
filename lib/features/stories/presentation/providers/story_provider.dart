import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/story.dart';
import '../../data/repositories/stories_repository_impl.dart';

final storyProvider = FutureProvider.family<Story, int>((ref, storyId) async {
  try {
    final repository = ref.watch(storiesRepositoryProvider);
    final story = await repository.getStory(storyId);
    if (story == null) {
      throw Exception('Story not found');
    }
    return story;
  } catch (e, stack) {
    print('Error fetching story $storyId: $e');
    print('Stack trace: $stack');
    rethrow;
  }
});
