import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fools_mate/components/source_card.dart';
import 'package:fools_mate/logic/source.dart';

class SourceCarousel extends StatelessWidget {
  final List<Source> sources;
  final bool agreed;

  const SourceCarousel(
      {super.key, required this.sources, required this.agreed});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: false,
      ),
      items: sources
          .map((source) => SourceCard(
                source: source,
                agreed: agreed,
              ))
          .toList(),
    );
  }
}
