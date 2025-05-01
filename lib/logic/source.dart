import 'dart:convert';
import 'package:intl/intl.dart';

class Source {
  final String publisher;
  final String website;

  final String url;
  final String details;
  final DateTime date;

  const Source({
    required this.publisher,
    required this.website,
    required this.url,
    required this.details,
    required this.date,
  });

  Source.fromMap(Map<String, dynamic> json)
      : this(
          publisher: json['publisher']['name'],
          website: json['publisher']['site'],
          url: json['information_url'],
          details: '',
          date: DateFormat("yyyy-MM-ddTHH:mm:ss").tryParse(json['reviewDate'])!,
        );

  Source.fromJson(String json)
      : this.fromMap(jsonDecode(json) as Map<String, dynamic>);
}
