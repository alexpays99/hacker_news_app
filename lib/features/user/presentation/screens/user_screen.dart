// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/utils/formatters.dart';
// import '../../../../core/widgets/error_view.dart';
// import '../../../../core/widgets/html_text.dart';
// import '../providers/user_provider.dart';
// import '../widgets/submission_tile.dart';

// class UserScreen extends ConsumerWidget {
//   final String userId;

//   const UserScreen({
//     super.key,
//     required this.userId,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userAsync = ref.watch(userProvider(userId));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(userId),
//       ),
//       body: userAsync.when(
//         data: (user) => ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${AppStrings.created}${DateFormatter.formatTimestamp(user.createdTimestamp)}',
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     if (user.karma > 0) ...[
//                       const SizedBox(height: 8),
//                       Text(
//                         '${AppStrings.karma}${user.karma}',
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                     ],
//                     if (user.about != null) ...[
//                       const SizedBox(height: 16),
//                       const Text(
//                         AppStrings.about,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       HtmlText(html: user.about!),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               AppStrings.submissions,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(height: 16),
//             if (user.submitted.isEmpty)
//               const Center(child: Text(AppStrings.noSubmissions))
//             else
//               ...user.submitted.take(30).map((storyId) => Hero(
//                     tag: 'story_$storyId',
//                     child: SubmissionTile(
//                       storyId: storyId,
//                       onTap: (url) async {
//                         if (url != null) {
//                           final uri = Uri.parse(url);
//                           if (await canLaunchUrl(uri)) {
//                             await launchUrl(uri,
//                                 mode: LaunchMode.externalApplication);
//                           }
//                         }
//                       },
//                     ),
//                   )),
//           ],
//         ),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => ErrorView(
//           message: error.toString(),
//           onRetry: () => ref.refresh(userProvider(userId)),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news_app/core/constants/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/formatters.dart';
import '../providers/user_provider.dart';
import '../widgets/expandable_text.dart';
import '../widgets/submission_tile.dart';

class UserScreen extends ConsumerWidget {
  final String userId;

  const UserScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: userAsyncValue.when(
        data: (user) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.id,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppStrings.created}${DateFormatter.formatTimestamp(user.createdTimestamp)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (user.karma > 0) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${AppStrings.karma}${user.karma}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                    if (user.about != null && user.about!.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Text(
                        AppStrings.about,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ExpandableText(user.about!),
                    ],
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppStrings.submissions,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              if (user.submitted.isEmpty)
                const Center(child: Text(AppStrings.noSubmissions))
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
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
