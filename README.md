![ez_qr](https://raw.githubusercontent.com/fogaiht/master/ez-qr.png)

[![pub points](https://badges.bar/sentry/pub%20points)](https://pub.dev/packages/sentry/score) [![pub points](https://badges.bar/sentry/pub%20points)](https://pub.dev/packages/sentry/score) [![pub points](https://badges.bar/sentry/pub%20points)](https://pub.dev/packages/sentry/score) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart) [![All Contributors](https://img.shields.io/badge/all_contributors-29-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<p align="left">

 <a href="https://pub.dartlang.org/packages/ez_qr">
    <img alt="ez_qr" src="https://img.shields.io/pub/v/ez_qr.svg">
  </a>
 <a href="https://github.com/Solido/awesome-flutter">
    <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square">
  </a>
 
 <!-- <a href="https://www.buymeacoffee.com/gQyz2MR">
    <img alt="Buy me a coffee" src="https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffee-yellow.svg">
  </a> -->
</p>

*This is a forked package from @hetian9288*

# ez_qr

QR code (scan code/picture) recognition(AndroidView/UiKitView)

A package that allows you to use the native camera to read qr code through images/files and has the flexibility to customize the view.

## Currently supported features
- Supports Android and iOS devices
- Place the QR code inside the square/custom_shape frame to get the information from QR code
- Select QR code from your local library from the image picker inside the ScanView
- Uses OS default native camera
- Accepts different types of standard and custom shapes (media, image, video, audio or any)

If you have any feature that you want to see in this package, please feel free to issue a suggestion. 🎉



## Qr code reader with default view

```dart
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
            Center(child: Text(result)),
          ],
        ),
      ),
    );
  }
}
```

### For IOS
Opt-in to the embedded views preview by adding a boolean property to the app's Info.plist file with the key io.flutter.embedded_views_preview and the value YES.

	<key>io.flutter.embedded_views_preview</key>
	<string>YES</string>

And you will need provide the description of camera's permission to work properly, otherwise will crash your app.
``` 
  <key>NSCameraUsageDescription</key>
	<string>The porpuse explaining why you will use the camera</string>
```

