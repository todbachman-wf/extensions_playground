import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/comments_plugin/providers/comments_selection_provider.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class ItalicHandler implements Handler {
  final String _commandId;
  final CommentsSelectionProvider _selectionProvider;

  @provide
  ItalicHandler(@italicCommandId this._commandId, this._selectionProvider);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => 'comments';

  @override
  void execute() {
    this._selectionProvider.isItalic = !this._selectionProvider.isItalic;
  }
}
