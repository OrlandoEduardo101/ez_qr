import 'package:flutter/material.dart';

class SquareMask extends CustomClipper<Path> {
  final double? cornerRadius;
  final double? scale;

  SquareMask({this.cornerRadius, this.scale = 1});

  @override
  Path getClip(Size size) {
    var _qrHole = RRect.fromLTRBR(
      // size.width * .32 * (scale as double),
      // size.width * .32 * (scale as double),
      // size.width * .64 * (scale as double),
      // size.width * .64 * (scale as double),
      size.width * 0 * (scale as double),
      size.width * 0 * (scale as double),
      size.width * 1 * (scale as double),
      size.height * 1 * (scale as double),
      Radius.circular(cornerRadius ?? 10),
    );

    var _path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0, size.height * 1)
      ..lineTo(size.width * 1, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0)
      ..fillType = PathFillType.evenOdd
      ..addRRect(_qrHole);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
