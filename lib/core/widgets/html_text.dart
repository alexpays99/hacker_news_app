import 'package:flutter/material.dart';

class HtmlText extends StatelessWidget {
  const HtmlText({super.key, required this.html});

  final String html;

  @override
  Widget build(BuildContext context) {
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
