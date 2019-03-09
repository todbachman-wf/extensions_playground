import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class CommandExtensionPoint extends WorkivaExtensionPoint<Command> {
  @provide
  CommandExtensionPoint(Plugin plugin)
      : super(plugin, commandsExtensionPointId);
}
