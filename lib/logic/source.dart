import 'dart:convert';
import 'package:intl/intl.dart';

class Source {
  final String publisher;
  final String website;

  final String url;
  final String details;
  //final DateTime date;

  const Source({
    required this.publisher,
    required this.website,
    required this.url,
    required this.details,
    //required this.date,
  });

  Source.fromMap(Map<String, dynamic> map)
      : this(
          publisher: map['publisher']['name'],
          website: map['publisher']['site'],
          url: map['information_url'],
          details: '',
          //date: DateFormat("yyyy-MM-ddTHH:mm:ss").tryParse(map['reviewDate'])!,
        );

  Source.fromJson(String json)
      : this.fromMap(jsonDecode(json) as Map<String, dynamic>);
}
