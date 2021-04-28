import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class FlutterGoogleTagManager extends PlatformInterface {
  FlutterGoogleTagManager() : super(token: _token);

  static final Object _token = Object();

  static FlutterGoogleTagManager _instance = FlutterGoogleTagManagerNoop();

  static FlutterGoogleTagManager get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(FlutterGoogleTagManager instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void pushEvent(String eventName, {Map<String, dynamic>? args});
}

class FlutterGoogleTagManagerNoop extends FlutterGoogleTagManager {
  @override
  void pushEvent(String eventName, {Map<String, dynamic>? args}) {}
}
