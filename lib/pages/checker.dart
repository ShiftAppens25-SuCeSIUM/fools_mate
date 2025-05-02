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
      debugPrint("ERROR: $e");
      debugPrint("Stack trace:");
      debugPrintStack(stackTrace: s);
      debugPrint("---------------------------------------------------------");
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
                          agreed: data.agree, disagreed: data.disagree),
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
