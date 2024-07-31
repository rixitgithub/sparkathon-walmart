// lib/screens/shopping_screen.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../tflite_model.dart'; // Import the model class

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  File? _image;
  String _result = 'No results yet';
  final ImagePicker _picker = ImagePicker();
  late TFLiteModel _model;

  @override
  void initState() {
    super.initState();
    _model = TFLiteModel(); // Initialize the model
  }

  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _runModelOnImage(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  void _runModelOnImage(File image) {
    var result = _model.runModelOnImage(image);
    setState(() {
      _result = result.toString(); // Update with the model's output
    });
  }

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
            if (_image != null)
              Image.file(_image!)
            else
              Text('Capture the cart image to detect items.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
            SizedBox(height: 20),
            Text('Result: $_result'), // Display result from model
          ],
        ),
      ),
    );
  }
}
