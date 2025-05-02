import 'package:flutter/material.dart';
import 'package:fools_mate/logic/api.dart';
import 'package:fools_mate/logic/fact_review.dart';

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
    return Container();
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

class MediaQuery extends Query {
  //TODO
  //final File media

  @override
  Widget promptView() {
    // TODO: implement promptView
    throw UnimplementedError();
  }

  @override
  Future<FactReview> fetchReview() {
    // TODO: implement fetchReview
    throw UnimplementedError();
  }
}
