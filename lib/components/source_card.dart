import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/source.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceCard extends StatelessWidget {
  final Source source;
  final bool agreed;

  const SourceCard({
    super.key,
    required this.source,
    required this.agreed,
  });

  void _launchUrl(BuildContext context) async {
    final uri = Uri.parse(source.url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(context),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      source.publisher,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    agreed
                        ? Icons.thumb_up_alt_rounded
                        : Icons.thumb_down_alt_rounded,
                    color: agreed ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (source.website != null)
                Text(
                  source.website ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              const SizedBox(height: 20),
              Expanded(
                child: Text(
                  source.details,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
