import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

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
            //final data = await rootBundle.load('assets/flutter_logo.png');
            //final buffer = data.buffer;
            final shareResult = await SharePlus.instance.share(
              ShareParams(
                files: [
                  XFile.fromData(
                    Uint8List(
                        0), //buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
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

/*
Ink(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.white,
        ),
        child: IconButton(
          color: AppColors.primary,
          icon: Icon(Icons.share),
          iconSize: 20,
          onPressed: () async {
            final box = context.findRenderObject() as RenderBox?;
            try {
              //final data = await rootBundle.load('assets/flutter_logo.png');
              //final buffer = data.buffer;
              final shareResult = await SharePlus.instance.share(
                ShareParams(
                  files: [
                    XFile.fromData(
                      Uint8List(
                          0), //buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
                      name: 'checkmate_review.png',
                      mimeType: 'image/png',
                    ),
                  ],
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size,
                  downloadFallbackEnabled: true,
                ),
              );
              print(shareResult.raw);
            } catch (e) {
              print("Share error: $e");
            }
          },
        ));
  }
*/
