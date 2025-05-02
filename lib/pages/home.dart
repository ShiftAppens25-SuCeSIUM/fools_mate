import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fools_mate/components/logo.dart';
import 'package:fools_mate/components/primary_button.dart';
import 'package:fools_mate/components/secondary_button.dart';
import 'package:fools_mate/globals.dart';
import 'package:fools_mate/logic/query.dart' as queries;
import 'package:fools_mate/pages/checker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topCenter,
                  child: Logo(height: 70),
                ),
                SizedBox(height: 10),
                Text(
                  'Think twice, check once.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.slogan,
                  ),
                ),
                SizedBox(height: 20),
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
                          controller: controller,
                          minLines: 6,
                          maxLines: 6,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.neutral,
                                width: 0.4,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        PrimaryButton(
                          text: "Submit text",
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Checker(
                                query: queries.TextQuery(controller.text),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text("OR",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            )),
                        SizedBox(height: 7),
                        SecondaryButton(
                          text: "Upload media",
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              File file = File(result.files.single.path!);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Checker(
                                        query: queries.FileQuery(file,
                                            query: controller.text.isEmpty
                                                ? null
                                                : controller.text))),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
