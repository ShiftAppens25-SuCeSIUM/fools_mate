import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';

class PromptCard extends StatelessWidget {
  final String query;

  const PromptCard({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.card,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What we searched:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    query,
                    style: TextStyle(
                      color: AppColors.slogan,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
