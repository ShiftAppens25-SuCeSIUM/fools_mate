import 'package:flutter/material.dart';
import 'package:fools_mate/components/primary_button.dart';
import 'package:fools_mate/components/secondary_button.dart';
import 'package:fools_mate/globals.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/logo.png',
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'CHECKMATE',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Truth, Verified.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.slogan,
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  color: AppColors.card,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          minLines: 3,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        PrimaryButton(text: "Submit text", onPressed: () {}),
                        SizedBox(height: 7),
                        Text("OR",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            )),
                        SizedBox(height: 7),
                        SecondaryButton(text: "Upload media", onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
