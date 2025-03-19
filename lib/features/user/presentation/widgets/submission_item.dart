import 'package:flutter/material.dart';

import '../../../stories/data/models/story.dart';
import 'expandable_text.dart';

class SubmissionItem extends StatelessWidget {
  final Story story;

  const SubmissionItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandableText(
          story.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
