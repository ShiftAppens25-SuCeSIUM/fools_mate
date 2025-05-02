import 'package:flutter/material.dart';
import 'package:fools_mate/components/source_carousel.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/source.dart';

class SourceToggle extends StatelessWidget {
  final List<Source> agreed;
  final List<Source> disagreed;
  final bool startAgreed;

  const SourceToggle({
    super.key,
    required this.agreed,
    required this.disagreed,
    required this.startAgreed,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: startAgreed ? 0 : 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Agreed (${agreed.length})'),
                Tab(text: 'Disagreed (${disagreed.length})'),
              ],
              labelColor: Colors.black,
              indicatorColor: AppColors.primary,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 320,
              child: TabBarView(children: [
                SourceCarousel(sources: agreed, agreed: true),
                SourceCarousel(sources: disagreed, agreed: false),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
