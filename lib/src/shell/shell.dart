import 'dart:html';

import 'package:extensions_playground/src/shell/shell_container.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

Future<Null> createShell() async {
  var shell = await Shell.create(new PlatformServicesModule());
  shell.getShell().render();
}

class AppShell {
  final MenuService _menuService;
  final ViewService _viewService;

  @provide
  AppShell(this._menuService, this._viewService);

  void render() {
    _renderToolbars();
    _renderContent();
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

  void _renderContent() {
    var target = querySelector('#contents');

    _viewService.getViewItems('workiva.rich.content').forEach((element) {
      var wrapper = new DivElement()
        ..className = 'content-item'
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
