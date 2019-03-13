import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/document_plugin/providers/document_selection_provider.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class ItalicHandler implements Handler {
  final String _commandId;
  DocumentSelectionProvider _selectionProvider;

  @provide
  ItalicHandler(this._selectionProvider, @italicCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => 'document';

  @override
  void execute() {
    _selectionProvider.isItalic = !_selectionProvider.isItalic;
  }
}
