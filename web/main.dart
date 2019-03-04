import 'dart:html' show querySelector;

import 'package:plugin/manager.dart';
import 'package:extensions_playground/extensions_playground.dart';

void main() {
  new ExtensionManager()
    ..processPlugins([
      new FormattingPlugin(),
      new WorkivaPlugin(),
    ]);

  new Shell()..render(querySelector('#shell'));
}
