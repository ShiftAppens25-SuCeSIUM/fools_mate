import 'dart:io';

import 'package:any_link_preview/any_link_preview.dart';
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
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.slogan,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
          const Divider(height: 20),
        ],
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
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: AnyLinkPreview(
        link: url,
        displayDirection: UIDirection.uiDirectionHorizontal,
        cache: const Duration(hours: 1),
        backgroundColor: AppColors.background,
        errorWidget: Container(
          color: AppColors.background,
          child: const Text('Oops!'),
        ),
        //errorImage: _errorImage,
      ),
    );
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
    //assume it is an image
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(file),
          ),
          if (query != null) ...[
            SizedBox(height: 10),
            Text(query!),
            Divider(height: 20),
          ],
        ],
      ),
    );
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
