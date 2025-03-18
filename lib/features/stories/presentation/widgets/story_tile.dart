import 'package:flutter/material.dart';
import '../../../../core/utils/formatters.dart';
import '../../data/models/story.dart';

class StoryTile extends StatelessWidget {
  final Story story;
  final VoidCallback onTap;
  final VoidCallback onAuthorTap;

  const StoryTile({
    super.key,
    required this.story,
    required this.onTap,
    required this.onAuthorTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedDate = DateFormatter.formatTimestamp(story.timestamp);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('by '),
                  GestureDetector(
                    onTap: onAuthorTap,
                    child: Text(
                      story.by,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                formattedDate,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
