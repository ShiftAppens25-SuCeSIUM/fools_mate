import 'dart:convert';

import 'package:fools_mate/logic/source.dart';

enum Status { TRUE, FALSE, MISLEADING }

class FactReview {
  final String query;

  final Status status;
  final double confidence;
  final List<Source> agree;
  final List<Source> disagree;

  const FactReview(
      {required this.query,
      required this.status,
      required this.confidence,
      required this.agree,
      required this.disagree});

  FactReview.fromMap(Map<String, dynamic> map)
      : this(
          query: map['query'],
          status: Status.values.firstWhere((s) =>
              s.name.toLowerCase() == (map['status'] as String).toLowerCase()),
          confidence: map['certainty'],
          agree: (map['agree sources'] as List<dynamic>)
              .map((s) => Source.fromMap(s))
              .toList(),
          disagree: (map['disagree sources'] as List<dynamic>)
              .map((s) => Source.fromMap(s))
              .toList(),
        );

  FactReview.fromJson(String json) : this.fromMap(jsonDecode(json));
}
