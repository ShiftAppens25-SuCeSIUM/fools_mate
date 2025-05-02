import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  final String status;

  const StatusIcon({super.key, required this.status});

  Color _getStatusColor(String status) {
    if (status.toLowerCase() == 'true') {
      return Colors.green;
    } else if (status.toLowerCase() == 'false') {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  IconData _getStatusIcon(String status) {
    if (status.toLowerCase() == 'true') {
      return Icons.check_circle;
    } else if (status.toLowerCase() == 'false') {
      return Icons.cancel;
    } else {
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
          _getStatusIcon(status),
          color: _getStatusColor(status),
          size: 32,
        ),
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(
            status.toUpperCase().replaceAll("_", " "),
            style: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 32,
              color: _getStatusColor(status),
            ),
          ),
        ),
      ],
    );
  }
}
