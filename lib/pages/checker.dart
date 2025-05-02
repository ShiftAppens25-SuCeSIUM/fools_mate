import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/components/score_card.dart';
import 'package:fools_mate/components/source_toggle.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/fact_review.dart';
import 'package:fools_mate/logic/query.dart';

class Checker extends StatefulWidget {
  final Query query;

  const Checker({required this.query, super.key});

  @override
  State<StatefulWidget> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  late final Future<FactReview> review;

  @override
  void initState() {
    super.initState();
    review = widget.query.fetchReview();
    review.catchError((e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint(e);
    }).ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: review,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final FactReview data = snapshot.data!;
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Logo(height: 35),
                      ),
                      SizedBox(height: 10),
                      ScoreCard(
                          query: widget.query,
                          status: data.status,
                          confidence: data.confidence),
                      SizedBox(height: 10),
                      SourceToggle(
                        agreed: data.agree,
                        disagreed: data.disagree,
                        startAgreed: data.status == "true",
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("Erro");
                } else {
                  final List<String> phrases = [
                    "Check your facts before they checkmate you.",
                    "Don’t bluff — verify your stuff.",
                    "No pawns in misinformation.",
                    "Fact check, then play your next move.",
                    "The truth is your queen.",
                  ];
                  final Random _random = Random();
                  final String selectedPhrase =
                      phrases[_random.nextInt(phrases.length)];

                  return Center(
                      heightFactor: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(
                              color: AppColors.primary),
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              selectedPhrase,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ));
                }
              }),
        ),
      ),
    );
  }
}
