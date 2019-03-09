import 'dart:html' show Element;

import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:inject/inject.dart';

class AppShell {
  final MenuService _menuService;

  @provide
  AppShell(this._menuService);

  void render(Element target) {
    _menuService.getAllMenuItems().forEach(target.append);
  }
}
