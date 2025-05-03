import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingIndicator> {
  late String selectedPhrase;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    final List<String> phrases = [
      "Check your facts before they checkmate you.",
      "Don’t bluff — verify your stuff.",
      "No pawns in misinformation.",
      "Fact check, then play your next move.",
      "The truth is your queen.",
    ];

    selectedPhrase = phrases[_random.nextInt(phrases.length)];
  }

  @override
  Widget build(Object context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(color: AppColors.primary),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            selectedPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
