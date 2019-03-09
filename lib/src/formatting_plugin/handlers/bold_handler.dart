import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:inject/inject.dart';

class BoldHandler implements Handler {
  final String _commandId;
  final FormattingService _formattingService;

  @provide
  BoldHandler(this._formattingService, @boldCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  void execute() {
    _formattingService.isBold = !_formattingService.isBold;
  }
}
