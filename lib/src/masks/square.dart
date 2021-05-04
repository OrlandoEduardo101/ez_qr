import 'package:flutter/material.dart';

class SquareMask extends CustomClipper<Path> {
  final double? cornerRadius;
  final double? scale;
  final BoxConstraints constraints;

  SquareMask(
    this.constraints, {
    this.cornerRadius,
    this.scale = 1,
  });

  @override
  Path getClip(Size size) {
    var squareSize = size.width * .4 * (scale as double);

    var horizontalCenterPoint = ((constraints.maxWidth - squareSize) / 2);
    var verticalCenterPoint = ((constraints.maxHeight - squareSize) / 2);

    var _qrHole = RRect.fromLTRBR(
      0 + horizontalCenterPoint, //Left
      0 + verticalCenterPoint, //Top
      squareSize + horizontalCenterPoint, //Right
      squareSize + verticalCenterPoint, //Bottom
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
