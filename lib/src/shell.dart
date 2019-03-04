import 'dart:html' show Element;

import 'workiva_plugin.dart';

class Shell {
  void render(Element target) {
    new Platform().menus.extensions.forEach((menu) {
      target.append(menu.component);
    });
  }
}
