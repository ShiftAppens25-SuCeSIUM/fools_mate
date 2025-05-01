import 'package:flutter/material.dart';
import 'package:fools_mate/globals.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo.png',
              height: 200,
            ),

            SizedBox(height: 20),

            Text(
          'CHECKMATE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8),

        Text(
          'Truth, Verified.',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
        ),

        SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                minLines: 3,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
            ),
            SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  }