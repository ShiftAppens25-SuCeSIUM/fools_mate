import 'package:flutter/material.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/components/score_card.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/fact_review.dart';
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
          child: FutureBuilder(
              future: query.fetchReview(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final FactReview data = snapshot.data!;
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Logo(height: 50),
                      ),
                      SizedBox(
                        width: 300,
                        height: 180,
                        child: ScoreCard(
                            status: data.status, confidence: data.confidence),
                      ),
                      SizedBox(height: 10),
                      query.promptView(),
                      SizedBox(height: 40),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("Erro");
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
