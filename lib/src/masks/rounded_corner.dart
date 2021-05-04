import 'package:flutter/material.dart';

class RoundedCornerMask extends CustomClipper<Path> {
  final double? cornerRadius;

  RoundedCornerMask({this.cornerRadius});

  @override
  Path getClip(Size size) {
    var _qrHole = RRect.fromLTRBR(
      size.width * .085,
      size.height * .16,
      size.width * .91,
      size.height * .69,
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
