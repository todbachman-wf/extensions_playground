import 'package:extensions_playground/src/workiva_plugin/extension_points/command_extension_point.dart';
import 'package:inject/inject.dart';

CommandService commandService;

abstract class Command {
  String get identifier;
}

abstract class CommandService {
  bool isRegistered(String commandId);
}

class CommandServiceImpl implements CommandService {
  final CommandExtensionPoint _commands;

  @provide
  CommandServiceImpl(this._commands);

  @override
  bool isRegistered(String commandId) =>
      _commands.extensionPoint.extensions.firstWhere(
          (cmd) => cmd.identifier == commandId,
          orElse: () => null) !=
      null;
}
