import 'package:flutter/material.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/query.dart';

class Checker extends StatelessWidget {
  final Query query;

  const Checker({required this.query, super.key});

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
              query.promptView(),
              SizedBox(height: 30),
              FutureBuilder(
                future: query.fetchReview(),
                builder: (context, snapshot) => Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
