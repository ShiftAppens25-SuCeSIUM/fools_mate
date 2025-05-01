import 'package:flutter/material.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/globals.dart';

class Checker extends StatelessWidget {
  const Checker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Logo(height: 50),
              ),
              SizedBox(height: 50),
              //TODO: prompt
              SizedBox(height: 30),
              //TODO: rating
            ],
          ),
        ),
      ),
    );
  }
}
