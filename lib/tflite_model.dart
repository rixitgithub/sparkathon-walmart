// lib/tflite_model.dart
import 'dart:typed_data';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteModel {
  late Interpreter _interpreter;

  TFLiteModel() {
    _loadModel();
  }

  void _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('model.tflite');
      print('Model loaded successfully.');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  List<dynamic> runModelOnImage(File imageFile) {
    var input = preprocessImage(imageFile);
    var output = List.generate(1 * 10, (index) => 0.0).reshape([1, 10]);

    _interpreter.run(input, output);
    return output;
  }

  Float32List preprocessImage(File imageFile) {
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
    img.Image resizedImage = img.copyResize(image!, width: 224, height: 224);

    Float32List imageAsList = imageToFloat32List(resizedImage);
    return imageAsList;
  }

  Float32List imageToFloat32List(img.Image image) {
    var buffer = Float32List(image.width * image.height * 3);
    int pixelIndex = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        int pixel = image.getPixel(x, y);
        buffer[pixelIndex++] = img.getRed(pixel) / 255.0; // Normalize to [0, 1]
        buffer[pixelIndex++] = img.getGreen(pixel) / 255.0;
        buffer[pixelIndex++] = img.getBlue(pixel) / 255.0;
      }
    }
    return buffer;
  }
}
