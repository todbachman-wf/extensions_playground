import 'dart:async';

import 'package:extensions_playground/src/selection_plugin/constants.dart';
import 'package:extensions_playground/src/selection_plugin/selection_commands_module.dart';
import 'package:extensions_playground/src/selection_plugin/selection_container.dart';
import 'package:extensions_playground/src/selection_plugin/selection_module.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/plugin.dart';

class SelectionPlugin extends Plugin {
  Selection _container;

  @override
  final String uniqueIdentifier = selectionPluginId;

  Future<Null> init() async {
    _container = await Selection.create(new PlatformServicesModule(),
        new SelectionCommandsModule(), new SelectionModule());
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
  }
}
