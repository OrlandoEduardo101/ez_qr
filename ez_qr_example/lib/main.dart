import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ez_qr/ez_qr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package example app'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var results = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanView(
                      readerFrom: ReaderFrom.camera,
                      screenCamSize: Size(
                        size.width * .825,
                        size.height * .53,
                      ),
                      positionCam: Size(
                        size.width * .085,
                        size.height * .16,
                      ),
                      cornerColor: const Color(0xff555555),
                      scanWidget: Center(
                        child: ClipPath(
                          clipper: Mask(),
                          child: Container(
                            decoration:
                                BoxDecoration(color: const Color(0xff555555)),
                          ),
                        ),
                      ),
                      afterScan: (qrCodeResult) {
                        print(qrCodeResult);
                      },
                    ),
                  ),
                );

                if (results != null) {
                  setState(() {
                    result = results;
                  });
                }
              },
              child: Text('Tap to scan'),
            ),
            ElevatedButton(
              onPressed: () async {
                var results = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanView(
                      cornerColor: Colors.blue,
                      readerFrom: ReaderFrom.gallery,
                    ),
                  ),
                );

                if (results != null) {
                  setState(() {
                    result = results;
                  });
                }
              },
              child: Text('Take from gallery'),
            ),
            Center(child: Text(result)),
          ],
        ),
      ),
    );
  }
}

class Mask extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var qrHole = RRect.fromLTRBR(
      size.width * .085,
      size.height * .16,
      size.width * .91,
      size.height * .69,
      Radius.circular(10),
    );

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0, size.height * 1)
      ..lineTo(size.width * 1, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0)
      ..fillType = PathFillType.evenOdd
      ..addRRect(qrHole);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
