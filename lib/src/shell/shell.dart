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
    _renderToolbars();
    _renderPanel('left');
    _renderPanel('right');
  }

  void _renderToolbars() {
    var target = querySelector('#toolbar');

    _menuService.getMenuItems('workiva.rich.toolbars.edit').forEach((element) {
      var wrapper = new DivElement()
        ..className = 'toolbar-item'
        ..append(element);
      target.append(wrapper);
    });
  }

  void _renderPanel(String orientation) {
    var target = querySelector('#panel-$orientation');

    _viewService
        .getViewItems('workiva.rich.panels.$orientation')
        .forEach((element) {
      var wrapper = new DivElement()
        ..className = 'panel-item'
        ..append(element);
      target.append(wrapper);
    });
  }
}
