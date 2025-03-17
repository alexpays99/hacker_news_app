import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/story.dart';
import '../../data/repositories/stories_repository_impl.dart';

final userSubmissionsProvider =
    FutureProvider.family<List<Story>, List<String>>(
        (ref, submissionIds) async {
  try {
    final repository = ref.watch(storiesRepositoryProvider);
    final submissions = await Future.wait(
      submissionIds
          .take(30) // Limit to first 30 submissions
          .map(int.parse)
          .map((id) => repository.getStory(id))
          .map((future) => future.catchError((e) => null)),
    );

    return submissions
        .whereType<Story>()
        .where((story) => story.type == 'story')
        .toList();
  } catch (e) {
    print('Error fetching user submissions: $e');
    return [];
  }
});
