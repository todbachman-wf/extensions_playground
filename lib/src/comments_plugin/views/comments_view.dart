import 'dart:html';

import 'package:extensions_playground/src/comments_plugin/providers/comments_selection_provider.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class CommentsView implements View {
  final ContextService _contextService;
  final CommentsSelectionProvider _selectionProvider;
  Element _element;
  TextAreaElement _textArea;
  final Uri _location = Uri.parse('view://workiva.rich.panels.right');

  @provide
  CommentsView(this._selectionProvider, this._contextService) {
    _selectionProvider.didChange.listen(_handleFormattingDidChange);
  }

  @override
  Element get component {
    if (_element == null) {
      _textArea = TextAreaElement()
        ..style.fontWeight = _getFontWeight()
        ..style.fontStyle = _getFontStyle()
        ..style.width = '95%'
        ..style.height = '100px'
        ..text = 'That\'s a really nice document.';

      _textArea.onFocus.listen((_) {
        _contextService.activate('comments');
      });

      _element = DivElement()
        ..append(DivElement()..text = 'Comments:')
        ..append(_textArea);
    }
    return _element;
  }

  @override
  Uri get location => _location;

  void _handleFormattingDidChange(Null _) {
    if (_element == null) return;

    _textArea.style
      ..fontWeight = _getFontWeight()
      ..fontStyle = _getFontStyle();
  }

  String _getFontWeight() => _selectionProvider.isBold ? 'bold' : 'normal';

  String _getFontStyle() => _selectionProvider.isItalic ? 'italic' : 'normal';
}
