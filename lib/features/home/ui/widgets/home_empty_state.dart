import 'package:animal_app/features/home/ui/widgets/home_empty_illustration.dart';
import 'package:animal_app/features/home/ui/widgets/home_empty_subtitle.dart';
import 'package:animal_app/features/home/ui/widgets/home_empty_title.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HomeEmptyIllustration(),
            const SizedBox(height: 7),
            HomeEmptyTitle(text: title),
            const SizedBox(height: 4),
            HomeEmptySubtitle(text: message),
          ],
        ),
      ),
    );
  }
}
