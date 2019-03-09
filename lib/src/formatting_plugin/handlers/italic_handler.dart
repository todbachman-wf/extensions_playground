import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:inject/inject.dart';

class ItalicHandler implements Handler {
  final String _commandId;
  FormattingService _formattingService;

  @provide
  ItalicHandler(this._formattingService, @italicCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  void execute() {
    _formattingService.isItalic = !_formattingService.isItalic;
  }
}
