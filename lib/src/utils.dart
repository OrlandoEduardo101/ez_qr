import 'package:flutter/material.dart';

enum ReaderFrom { gallery, camera }
enum MaskType { fullscreen, roudedCorner, square, circle, custom }

class CustomMaskData {
  final double? cornerRadius;
  final Offset horizontalDots; //(left, right)
  final Offset verticalDots; //(top, bottom)

  CustomMaskData({
    this.cornerRadius,
    required this.horizontalDots,
    required this.verticalDots,
  });
}
