import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Shopping'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Capture the cart image to detect items.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle image capture and item detection using AI model
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Capture Image functionality to be implemented')),
                );
              },
              child: Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }
}
