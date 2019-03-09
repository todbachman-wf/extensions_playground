import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:inject/inject.dart';

const boldCommand = const Qualifier(#boldCommand);
const boldCommandId = const Qualifier(#boldCommandId);

const italicCommand = const Qualifier(#italicCommand);
const italicCommandId = const Qualifier(#italicCommandId);

class FormattingCommand implements Command {
  final String _commandId;

  FormattingCommand(this._commandId);

  @override
  String get identifier => _commandId;
}
