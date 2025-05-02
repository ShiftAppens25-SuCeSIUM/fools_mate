import 'dart:convert';

import 'package:fools_mate/logic/source.dart';

class FactReview {
  final String query;

  final String status;
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
          status: (map['status'] as String).toLowerCase(),
          confidence: map['certainty'],
          agree: (map['agree_sources'] as List<dynamic>)
              .map((s) => Source.fromMap(s))
              .toList(),
          disagree: (map['disagree_sources'] as List<dynamic>)
              .map((s) => Source.fromMap(s))
              .toList(),
        );

  FactReview.fromJson(String json) : this.fromMap(jsonDecode(json));
}
