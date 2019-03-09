import 'dart:html';

import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:plugin/plugin.dart';

class Platform implements HandlerService, CommandService, MenuService {
  static Platform _platform;

  final ExtensionPoint<Menu> _menus;
  final ExtensionPoint<Command> _commands;
  final ExtensionPoint<Handler> _handlers;

  factory Platform() => _platform;

  Platform._(this._menus, this._commands, this._handlers);

  static load(ExtensionPoint<Menu> menus, ExtensionPoint<Command> commands,
      ExtensionPoint<Handler> handlers) {
    _platform = new Platform._(menus, commands, handlers);
  }

  ExtensionPoint<Menu> get menus => _menus;
  ExtensionPoint<Command> get commands => _commands;
  ExtensionPoint<Handler> get handlers => _handlers;

  @override
  void executeCommand(String commandId) {
    if (!isRegistered(commandId)) return;

    var handler =
        handlers.extensions.firstWhere((h) => h.commandId == commandId);
    if (handler == null) {
      return;
    }

    handler.execute();
  }

  @override
  bool isRegistered(String commandId) =>
      commands.extensions.firstWhere((cmd) => cmd.identifier == commandId,
          orElse: () => null) !=
      null;

  @override
  Iterable<Element> getAllMenuItems() =>
      _menus.extensions.map((menu) => menu.component);
}
