import 'dart:async';

import 'package:extensions_playground/src/formatting_plugin/constants.dart';
import 'package:extensions_playground/src/formatting_plugin/formatting_container.dart';
import 'package:extensions_playground/src/formatting_plugin/formatting_module.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_services_module.dart';
import 'package:plugin/plugin.dart';

class FormattingPlugin extends Plugin {
  Formatting _container;

  @override
  final String uniqueIdentifier = formattingPluginId;

  Future<Null> init() async {
    _container = await Formatting.create(
        new PlatformServicesModule(), new FormattingModule());
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {}

  @override
  void registerExtensions(RegisterExtension register) {
    // commands
    register(
        _container.getCommandsExtensionPointId(), _container.getBoldCommand());
    register(_container.getCommandsExtensionPointId(),
        _container.getItalicCommand());

    // handlers
    register(
        _container.getHandlersExtensionPointId(), _container.getBoldHandler());
    register(_container.getHandlersExtensionPointId(),
        _container.getItalicHandler());

    // menus
    register(_container.getMenusExtensionPointId(), _container.getBoldButton());
    register(
        _container.getMenusExtensionPointId(), _container.getItalicButton());
    
    // views
    register(_container.getViewsExtensionPointId(), _container.getFormattingView());
  }
}
