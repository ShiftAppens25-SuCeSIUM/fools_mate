import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final ScreenshotController screenshotController;

  const ShareButton({required this.screenshotController, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: Colors.white,
      elevation: 3.0,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () async {
          final box = context.findRenderObject() as RenderBox?;
          try {
            final data = await screenshotController.capture();
            final shareResult = await SharePlus.instance.share(
              ShareParams(
                files: [
                  XFile.fromData(
                    data!,
                    name: 'checkmate_review.png',
                    mimeType: 'image/png',
                  ),
                ],
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                downloadFallbackEnabled: true,
              ),
            );
            print(shareResult.raw);
          } catch (e) {
            print("Share error: $e");
          }
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Icons.share, color: AppColors.primary),
        ),
      ),
    );
  }
}
