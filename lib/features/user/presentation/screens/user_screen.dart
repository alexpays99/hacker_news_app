import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/html_text.dart';
import '../providers/user_provider.dart';
import '../widgets/submission_tile.dart';

class UserScreen extends ConsumerWidget {
  final String userId;

  const UserScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: Text(userId),
      ),
      body: userAsync.when(
        data: (user) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Created: ${DateFormatter.formatTimestamp(user.createdTimestamp)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (user.karma > 0) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Karma: ${user.karma}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                    if (user.about != null) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      HtmlText(html: user.about!),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Submissions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            if (user.submitted.isEmpty)
              const Center(child: Text('No submissions yet'))
            else
              ...user.submitted.take(30).map((storyId) => Hero(
                    tag: 'story_$storyId',
                    child: SubmissionTile(
                      storyId: storyId,
                      onTap: (url) async {
                        if (url != null) {
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          }
                        }
                      },
                    ),
                  )),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.refresh(userProvider(userId)),
        ),
      ),
    );
  }
}
