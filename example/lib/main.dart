import 'package:flutter/material.dart';
import 'package:flutter_google_tag_manager_web/flutter_google_tag_manager_web.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FlutterGoogleTagManagerWebPlugin _gtm =
      FlutterGoogleTagManagerWebPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Hello world.\n'),
              ElevatedButton(
                child: Text('Trigger event.'),
                onPressed: () {
                  _gtm.pushEvent('TestEvent');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
