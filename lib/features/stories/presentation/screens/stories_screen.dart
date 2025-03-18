import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/error_view.dart';
import '../providers/stories_provider.dart';
import '../widgets/story_tile.dart';

class StoriesScreen extends ConsumerWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesAsync = ref.watch(storiesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.read(storiesNotifierProvider.notifier).refresh(),
          ),
        ],
      ),
      body: storiesAsync.when(
        data: (stories) => RefreshIndicator(
          onRefresh: () => ref.read(storiesNotifierProvider.notifier).refresh(),
          child: stories.isEmpty
              ? const Center(child: Text('No stories available'))
              : ListView.builder(
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return StoryTile(
                      story: story,
                      onTap: () async {
                        if (story.url != null) {
                          final uri = Uri.parse(story.url!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          }
                        }
                      },
                      onAuthorTap: () => context.pushNamed(
                        'user',
                        params: {'id': story.by},
                      ),
                    );
                  },
                ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.read(storiesNotifierProvider.notifier).refresh(),
        ),
      ),
    );
  }
}
