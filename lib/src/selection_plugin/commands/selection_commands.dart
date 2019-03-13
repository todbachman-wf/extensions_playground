import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

const boldCommand = const Qualifier(#boldCommand);
const boldCommandId = const Qualifier(#boldCommandId);

const italicCommand = const Qualifier(#italicCommand);
const italicCommandId = const Qualifier(#italicCommandId);

class SelectionCommand implements Command {
  final String _commandId;

  SelectionCommand(this._commandId);

  @override
  String get identifier => _commandId;
}
