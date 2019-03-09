import 'package:plugin/plugin.dart';

class WorkivaExtensionPoint<T> {
  ExtensionPoint<T> _inner;

  WorkivaExtensionPoint(Plugin plugin, String simpleIdentifier) {
    _inner = new ExtensionPoint<T>(plugin, simpleIdentifier, null);
  }

  ExtensionPoint<T> get extensionPoint => _inner;
}
