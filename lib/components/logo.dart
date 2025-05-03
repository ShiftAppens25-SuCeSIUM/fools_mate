import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({super.key, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/logo-purple.png", height: height),
        SizedBox(width: height / 8),
        Column(
          children: [
            SizedBox(height: height * 20 / 100),
            Text(
              "CHECKMATE",
              style: TextStyle(
                fontFamily: "BebasNeue",
                fontSize: height,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
