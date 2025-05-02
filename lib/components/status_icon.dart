import 'package:flutter/material.dart';
import 'package:fools_mate/logic/fact_review.dart';

class StatusIcon extends StatelessWidget {
  final Status status;

  const StatusIcon({super.key, required this.status});

  Color _getStatusColor() {
    switch (status) {
      case Status.TRUE:
        return Colors.green;
      case Status.FALSE:
        return Colors.red;
      case Status.MIXED:
        return Colors.orange;
    }
  }

  String _getStatusText() {
    switch (status) {
      case Status.TRUE:
        return "TRUE";
      case Status.FALSE:
        return "FALSE";
      case Status.MIXED:
        return "MIXED";
    }
  }

  IconData _getStatusIcon() {
    switch (status) {
      case Status.TRUE:
        return Icons.check_circle;
      case Status.FALSE:
        return Icons.cancel;
      case Status.MIXED:
        return Icons.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          _getStatusIcon(),
          color: _getStatusColor(),
          size: 32,
        ),
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(
            _getStatusText(),
            style: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 32,
              color: _getStatusColor(),
            ),
          ),
        ),
      ],
    );
  }
}
