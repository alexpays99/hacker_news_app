import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news_app/core/utils/formatters.dart';
import '../../../stories/data/repositories/stories_repository_impl.dart';

class SubmissionTile extends ConsumerWidget {
  const SubmissionTile({
    super.key,
    required this.storyId,
    required this.onTap,
  });

  final int storyId;
  final void Function(String? url) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync = ref.watch(
      FutureProvider((ref) {
        final repository = ref.watch(storiesRepositoryProvider);
        return repository.getStory(storyId);
      }),
    );

    return storyAsync.when(
      data: (story) => Card(
        child: ListTile(
          title: Text(story.title),
          subtitle: Text(DateFormatter.formatTimestamp(story.timestamp)),
          onTap: () => onTap(story.url),
        ),
      ),
      loading: () => const Card(
        child: ListTile(
          leading: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          title: Text('Loading...'),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
