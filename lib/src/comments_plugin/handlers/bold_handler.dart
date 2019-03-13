import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/comments_plugin/providers/comments_selection_provider.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class BoldHandler implements Handler {
  final String _commandId;
  final CommentsSelectionProvider _selectionProvider;

  @provide
  BoldHandler(@boldCommandId this._commandId, this._selectionProvider);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => 'comments';

  @override
  void execute() {
    _selectionProvider.isBold = !_selectionProvider.isBold;
  }
}
