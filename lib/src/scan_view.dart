import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ez_qr.dart';
import 'qrcode_reader_view.dart';

class ScanView extends StatefulWidget {
  final Color? cornerColor;
  final Widget? scanWidget;
  final Size? screenCamSize;
  final Size? positionCam;
  final Function(String)? afterScan;
  final Widget? bottomContent;
  final ReaderFrom readerFrom;
  final MaskType? maskType;
  final double? squareMaskScale;
  final CustomMaskData? customMaskData;

  ScanView({
    Key? key,
    this.cornerColor,
    this.scanWidget,
    this.screenCamSize,
    this.positionCam,
    this.afterScan,
    this.bottomContent,
    required this.readerFrom,
    this.maskType = MaskType.fullscreen,
    this.squareMaskScale = 1,
    this.customMaskData,
  }) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final GlobalKey<QrcodeReaderViewState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrcodeReaderView(
        readerFrom: widget.readerFrom,
        key: _key,
        onScan: onScan,
        maskType: widget.maskType,
        screenCamSize: widget.screenCamSize,
        positionCam: widget.positionCam,
        cornerColor: widget.cornerColor ?? Colors.white,
        scanWidget: widget.scanWidget,
        squareMaskScale: widget.squareMaskScale,
        customMaskData: widget.customMaskData,
        bottomContent: widget.bottomContent ??
            Container(
              padding: EdgeInsets.symmetric(horizontal: 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Centralize o QR Code na área demarcada',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Future onScan(String data) async {
    if (widget.afterScan != null) {
      widget.afterScan!(data);
      Navigator.of(context).pop(data);
    } else {
      Navigator.of(context).pop(data);
    }
  }
}
