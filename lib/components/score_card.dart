import 'package:flutter/material.dart';
import 'package:fools_mate/components/status_icon.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/fact_review.dart';

class ScoreCard extends StatelessWidget {
  final Status status;
  final double confidence;

  const ScoreCard({
    super.key,
    required this.status,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      elevation: 4,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusIcon(status: status),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: '${(confidence / 100).round()}%',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' of confidence'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
