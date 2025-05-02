import 'package:fools_mate/globals.dart' as globals;
import 'package:http/http.dart' as http;

import 'package:fools_mate/logic/fact_review.dart';

Future<FactReview> reviewText(String query) async {
  final response =
      await http.post(Uri.http(globals.API, 'fact_check/text'), body: query);

  return FactReview.fromJson(response.body);
}

Future<FactReview> reviewURL(String url) async {
  final response =
      await http.post(Uri.http(globals.API, 'fact_check/url'), body: url);

  return FactReview.fromJson(response.body);
}
