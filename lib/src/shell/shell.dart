import 'dart:html';

import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view_service.dart';
import 'package:inject/inject.dart';

class AppShell {
  final MenuService _menuService;
  final ViewService _viewService;

  @provide
  AppShell(this._menuService, this._viewService);

  void render() {
    _renderToolbars(querySelector('#toolbar'));
    _renderPanels(querySelector('#panel-right'));
  }

  void _renderToolbars(Element target) {
    _menuService.getAllMenuItems().forEach((element) {
      var wrapper = new DivElement()
        ..className = 'toolbar-item'
        ..append(element);
      target.append(wrapper);
    });
  }

  void _renderPanels(Element target) {
    _viewService.getAllViewItems().forEach((element) {
      var wrapper = new DivElement()
        ..className = 'panel-item'
        ..append(element);
      target.append(wrapper);
    });
  }
}
