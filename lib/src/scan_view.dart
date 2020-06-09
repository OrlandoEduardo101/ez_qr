import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:super_qr_reader/src/qrcode_reader_view.dart';

class ScanView extends StatefulWidget {
  final Color cornerColor;
  ScanView({Key key, this.cornerColor}) : super(key: key);

  @override
  _ScanViewState createState() => new _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        cornerColor: widget.cornerColor ?? Colors.white,
        // scanWidget: Center(
        //   child: Container(
        //     // padding: EdgeInsets.all(),
        //     decoration: BoxDecoration(
        //       // color: Colors.red,
        //       border: Border.all(width: 5.0, color: Colors.green, style: BorderStyle.solid),
        //     ),
        //     width: MediaQuery.of(context).size.width * (0.9),
        //     height: MediaQuery.of(context).size.width * (0.9),
        //   ),
        // ),
      ),
    );
  }

  Future onScan(String data) async {
    Navigator.of(context).pop(data);
  }
}
