import 'dart:html' show Element;

import 'package:plugin/plugin.dart';

class View {
  final Element component;

  View(this.component);
}

class Menu {
  final Element component;

  Menu(this.component);
}

class Command {
  final String identifier;

  Command(this.identifier);
}

typedef void HandlerExecute();

class Handler {
  final HandlerExecute execute;
  final String commandId;

  Handler(this.commandId, this.execute);
}

class Platform {
  static Platform _platform;

  final ExtensionPoint<Menu> _menus;
  final ExtensionPoint<Command> _commands;
  final ExtensionPoint<Handler> _handlers;
  final ExtensionPoint<View> _views;

  factory Platform() => _platform;

  Platform._(this._menus, this._commands, this._handlers, this._views);

  static load(Platform platform) {
    _platform = platform;
  }

  ExtensionPoint<Menu> get menus => _menus;
  ExtensionPoint<Command> get commands => _commands;
  ExtensionPoint<Handler> get handlers => _handlers;
  ExtensionPoint<View> get views => _views;

  void executeCommand(String commandId) {
    if (commands.extensions.firstWhere((cmd) => cmd.identifier == commandId) ==
        null) {
      return;
    }

    var handler =
        handlers.extensions.firstWhere((h) => h.commandId == commandId);
    if (handler == null) {
      return;
    }

    handler.execute();
  }
}

class WorkivaPlugin extends Plugin {
  @override
  final String uniqueIdentifier = 'workiva';

  WorkivaPlugin() {
    var menus = new ExtensionPoint<Menu>(this, 'menus', null);
    var commands = new ExtensionPoint<Command>(this, 'commands', null);
    var handlers = new ExtensionPoint<Handler>(this, 'handlers', null);
    var views = new ExtensionPoint<View>(this, 'views', null);

    Platform.load(new Platform._(menus, commands, handlers, views));
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {
    var platform = new Platform();
    register(platform.menus);
    register(platform.commands);
    register(platform.handlers);
    register(platform.views);
  }

  @override
  void registerExtensions(RegisterExtension register) {}
}
