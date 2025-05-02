import 'dart:convert';
import 'dart:io';

import 'package:fools_mate/globals.dart' as globals;
import 'package:http/http.dart' as http;

import 'package:fools_mate/logic/fact_review.dart';

Future<FactReview> reviewText(String query) async {
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };

  final response = await http.post(
    Uri.parse("${globals.API}/text"),
    headers: headers,
    body: jsonEncode({"query": query}),
  );

  print(response.body);
  return FactReview.fromJson(response.body);
}

Future<FactReview> reviewURL(String url) async {
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };

  final response = await http.post(
    Uri.parse("${globals.API}/link"),
    headers: headers,
    body: jsonEncode({"query": url}),
  );

  print(response.body);
  return FactReview.fromJson(response.body);
}

Future<FactReview> reviewFile(File file, {String? query}) async {
  final uri = Uri.parse("${globals.API}/file");
  final headers = <String, String>{'Content-Type': 'multipart/form-data'};
  final data = http.MultipartFile.fromBytes("files", await file.readAsBytes(),
      filename: file.path.split("/").last);

  final request = http.MultipartRequest("post", uri)
    ..headers.addAll(headers)
    ..files.add(data);

  if (query != null) {
    request.fields['query'] = query;
  }

  final response = await http.Response.fromStream(await request.send());

  print(response.body);
  return FactReview.fromJson(response.body);
}
