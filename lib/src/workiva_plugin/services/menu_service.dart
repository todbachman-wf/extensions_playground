import 'dart:html' show Element;

import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:inject/inject.dart';

MenuService menuService;

abstract class MenuService {
  Iterable<Element> getMenuItems(String location);
}

class MenuServiceImpl implements MenuService {
  final MenuExtensionPoint _menus;

  @provide
  MenuServiceImpl(this._menus);

  @override
  Iterable<Element> getMenuItems(String location) =>
      _menus.extensionPoint.extensions
          .where((menu) =>
              menu.location.scheme == 'menu' && menu.location.host == location)
          .map((menu) => menu.component);
}
