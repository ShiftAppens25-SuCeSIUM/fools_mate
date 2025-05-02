import 'package:flutter/material.dart';
import 'package:fools_mate/components/status_icon.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/fact_review.dart';
import 'package:fools_mate/logic/query.dart';

class ScoreCard extends StatelessWidget {
  final Query query;
  final Status status;
  final double confidence;

  const ScoreCard({
    super.key,
    required this.status,
    required this.confidence,
    required this.query,
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
            query.promptView(),
            const Divider(),
            StatusIcon(status: status),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: 'Confidence level of: '),
                  TextSpan(
                    text: '${(confidence * 100).round()}%',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
