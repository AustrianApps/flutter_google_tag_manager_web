@JS()
library flutter_google_tag_manager_web;

import 'dart:async';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/services.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS("dataLayer.push")
external void _push(data);

void _dataLayerPush(Map<String, dynamic> data) {
  _push(jsify(data));
}

class FlutterGoogleTagManagerWebPlugin {
  FlutterGoogleTagManagerWebPlugin._();
  factory FlutterGoogleTagManagerWebPlugin() => _instance;

  static FlutterGoogleTagManagerWebPlugin _instance;

  void pushEvent(String eventName, {Map<String, dynamic> args}) {
    _dataLayerPush({'event': eventName, ...?args});
  }

  /// Registers that [FirebaseCoreWeb] is the platform implementation.
  static void registerWith(Registrar registrar) {
    _instance = FlutterGoogleTagManagerWebPlugin._();
  }
}
