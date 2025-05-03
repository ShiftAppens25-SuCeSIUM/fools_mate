import 'package:flutter/material.dart';
import 'package:fools_mate/components/status_icon.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/query.dart';

class ScoreCard extends StatelessWidget {
  final Query query;
  final String status;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          query.promptView(),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                StatusIcon(status: status),
                SizedBox(height: 6),
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
          )
        ],
      ),
    );
  }
}
