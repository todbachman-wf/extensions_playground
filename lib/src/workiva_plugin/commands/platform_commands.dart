import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

const createDocumentCommand = const Qualifier(#createDocumentCommand);
const createDocumentCommandId = const Qualifier(#createDocumentCommandId);

class WorkivaCommand implements Command {
  final String _commandId;

  WorkivaCommand(this._commandId);

  @override
  String get identifier => _commandId;
}
