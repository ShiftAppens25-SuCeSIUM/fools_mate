import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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

  final json = utf8.decode(response.bodyBytes);
  debugPrint(json);
  return FactReview.fromJson(json);
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

  final json = utf8.decode(response.bodyBytes);
  debugPrint(json);
  return FactReview.fromJson(json);
}

Future<FactReview> reviewFile(File file, {String? query}) async {
  final uri = Uri.parse("${globals.API}/file");
  final headers = <String, String>{'Content-Type': 'multipart/form-data'};
  final data = http.MultipartFile.fromBytes("files", await file.readAsBytes(),
      filename: file.path.split("/").last);

  final request = http.MultipartRequest("post", uri)
    ..headers.addAll(headers)
    ..fields.addAll({'query': query ?? ''})
    ..files.add(data);

  final response = await http.Response.fromStream(await request.send());

  final json = utf8.decode(response.bodyBytes);
  debugPrint(json);
  return FactReview.fromJson(json);
}
