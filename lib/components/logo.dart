import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("lib/assets/logo2.png", height: 90),
        SizedBox(width: 10),
        Column(
          children: [
            SizedBox(height: 8),
            Text(
              "CHECKMATE",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
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
