import 'dart:html' show Element;

import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:inject/inject.dart';

MenuService menuService;

abstract class Menu {
  Element get component;
}

abstract class MenuService {
  Iterable<Element> getAllMenuItems();
}

class MenuServiceImpl implements MenuService {
  final MenuExtensionPoint _menus;

  @provide
  MenuServiceImpl(this._menus);

  @override
  Iterable<Element> getAllMenuItems() =>
      _menus.extensionPoint.extensions.map((menu) => menu.component);
}
