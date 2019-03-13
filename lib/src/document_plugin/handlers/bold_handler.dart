import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/document_plugin/providers/document_selection_provider.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class BoldHandler implements Handler {
  final String _commandId;
  final DocumentSelectionProvider _selectionProvider;

  @provide
  BoldHandler(this._selectionProvider, @boldCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => 'document';

  @override
  void execute() {
    _selectionProvider.isBold = !_selectionProvider.isBold;
  }
}
