import 'package:flutter/material.dart';

class HtmlText extends StatelessWidget {
  final String html;

  const HtmlText({
    super.key,
    required this.html,
  });

  @override
  Widget build(BuildContext context) {
    // Basic HTML to text conversion - in a production app, you might want to use
    // a package like flutter_html for proper HTML rendering
    final text = html
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#x27;', "'");

    return Text(text);
  }
}