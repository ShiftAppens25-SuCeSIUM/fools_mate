import 'package:flutter/material.dart';
import 'package:fools_mate/components/loading_indicator.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/components/share_button.dart';
import 'package:fools_mate/components/source_toggle.dart';
import 'package:fools_mate/components/status_icon.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/fact_review.dart';
import 'package:fools_mate/logic/query.dart';
import 'package:screenshot/screenshot.dart';

class Checker extends StatefulWidget {
  final Query query;

  const Checker({required this.query, super.key});

  @override
  State<StatefulWidget> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  final screenshotController = ScreenshotController();
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
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: review,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Erro");
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Logo(height: 35),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: ShareButton(
                                  screenshotController: screenshotController),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: AppColors.card,
                          elevation: 4,
                          margin: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.query.promptView(),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 24, right: 24, bottom: 24),
                                child: Column(
                                  children: [
                                    if (snapshot.hasData) ...[
                                      StatusIcon(status: snapshot.data!.status),
                                      SizedBox(height: 6),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text: 'Confidence level of: '),
                                            TextSpan(
                                              text:
                                                  '${(snapshot.data!.confidence * 100).round()}%',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    if (!snapshot.hasData) LoadingIndicator(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        if (snapshot.hasData)
                          SourceToggle(
                            agreed: snapshot.data!.agree,
                            disagreed: snapshot.data!.disagree,
                            startAgreed: snapshot.data!.status == "true",
                          ),
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
