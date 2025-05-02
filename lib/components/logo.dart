import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({super.key, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("lib/assets/logo-purple.png", height: height),
        SizedBox(width: height / 10),
        Column(
          children: [
            SizedBox(height: height * 8 / 100),
            Text(
              "CHECKMATE",
              style: GoogleFonts.bebasNeue(
                fontSize: height / 2,
                fontWeight: FontWeight.normal,
                color: AppColors.primary,
              ),
            )
          ],
        ),
      ],
    );
  }
}
