import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart';

class PhotoHelper {
  static Future<bool> compressPhoto(File inputFile,File outputFile) async {
    try {
      File orientationPhoto = await compute(getOrientationImage,inputFile);
      var result = await FlutterImageCompress.compressAndGetFile(
        orientationPhoto.path,
        outputFile.path,
        quality: 30,
      );
      return result != null;
    } catch (e) {

    }
    return false;
  }

  static Future<File> getOrientationImage(File inputFile) async {
    final Image? capturedImage = decodeImage(inputFile.readAsBytesSync());
    if (capturedImage != null) {
      final Image orientedImage = bakeOrientation(capturedImage);
      inputFile.writeAsBytesSync(encodeJpg(orientedImage));
    }
    return inputFile;
  }
}
