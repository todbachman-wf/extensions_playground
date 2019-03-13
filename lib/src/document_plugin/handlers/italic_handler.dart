import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class ItalicHandler implements Handler {
  final String _commandId;
  SelectionService _selectionService;

  @provide
  ItalicHandler(this._selectionService, @italicCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => null;

  @override
  void execute() {
    _selectionService.isItalic = !_selectionService.isItalic;
  }
}
