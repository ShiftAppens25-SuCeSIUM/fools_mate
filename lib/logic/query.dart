import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/api.dart';
import 'package:fools_mate/logic/fact_review.dart';
import 'package:fools_mate/logic/source.dart';

abstract class Query {
  const Query();

  Widget promptView();
  Future<FactReview> fetchReview();
}

class TextQuery extends Query {
  final String text;

  const TextQuery(this.text);

  @override
  Widget promptView() {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.slogan,
        fontStyle: FontStyle.italic,
        fontSize: 16,
      ),
    );
  }

  @override
  Future<FactReview> fetchReview() => reviewText(text);
}

class UrlQuery extends Query {
  final String url;

  const UrlQuery(this.url);

  @override
  Widget promptView() {
    return Container();
  }

  @override
  Future<FactReview> fetchReview() => reviewURL(url);
}

class FileQuery extends Query {
  final File file;
  final String? query;

  const FileQuery(this.file, {this.query});

  @override
  Widget promptView() {
    return Container();
  }

  @override
  Future<FactReview> fetchReview() => reviewFile(file, query: query);
}

class TestQuery extends Query {
  List<Source> sourceListOne = [
    Source(
      publisher: 'BBC News',
      website: 'bbc.com',
      url: 'https://www.bbc.com/news/world',
      details: 'International news and updates from BBC.',
    ),
    Source(
      publisher: 'CNN',
      website: 'cnn.com',
      url: 'https://www.cnn.com/world',
      details: 'Latest world news from CNN.',
    ),
  ];

  // Second list of sources
  List<Source> sourceListTwo = [
    Source(
      publisher: 'The Verge',
      website: 'theverge.com',
      url: 'https://www.theverge.com/tech',
      details: 'Technology news and product reviews.',
    ),
    Source(
      publisher: 'TechCrunch',
      website: 'techcrunch.com',
      url: 'https://techcrunch.com',
      details: 'Startup and tech industry news.',
    ),
  ];

  @override
  Widget promptView() {
    return Text(
      "A Terra é quadrada?",
      style: TextStyle(
        color: AppColors.slogan,
        fontStyle: FontStyle.italic,
        fontSize: 16,
      ),
    );
  }

  @override
  Future<FactReview> fetchReview() {
    return Future.delayed(
        Duration(seconds: 2),
        () => FactReview(
            query: "A Terra é quadrada?",
            status: "true",
            confidence: 0.84,
            agree: sourceListOne,
            disagree: sourceListTwo));
  }
}
