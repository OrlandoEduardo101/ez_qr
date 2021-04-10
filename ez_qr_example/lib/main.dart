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
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
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
                String? results = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanView(
                      cornerColor: Colors.blue,
                      readerFrom: ReaderFrom.camera,
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
                String? results = await Navigator.push(
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
