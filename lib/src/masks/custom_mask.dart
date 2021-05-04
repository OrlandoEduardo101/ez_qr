import 'package:flutter/material.dart';

import '../utils.dart';

class CustomMask extends CustomClipper<Path> {
  final BoxConstraints constraints;
  final CustomMaskData data;

  CustomMask(
    this.constraints,
    this.data,
  );

  @override
  Path getClip(Size size) {
    final left = data.horizontalDots.dx;
    final top = data.verticalDots.dx;
    final right = data.horizontalDots.dy;
    final bottom = data.verticalDots.dy;

    var _leftCenterPoint = ((constraints.maxWidth) / 2);
    var _topCenterPoint = ((constraints.maxWidth) / 2);
    var _rightCenterPoint = ((constraints.maxWidth) / 2);
    var _bottomCenterPoint = ((constraints.maxHeight) / 2);

    var _qrHole = RRect.fromLTRBR(
      left + _leftCenterPoint, //Left
      top + _topCenterPoint, //Top
      right + _rightCenterPoint, //Right
      bottom + _bottomCenterPoint, //Bottom
      Radius.circular(data.cornerRadius ?? 10),
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
