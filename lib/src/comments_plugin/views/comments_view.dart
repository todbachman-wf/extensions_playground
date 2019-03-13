import 'dart:html';

import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class CommentsView implements View {
  final ContextService _contextService;
  Element _element;
  TextAreaElement _textArea;
  final Uri _location = Uri.parse('view://workiva.rich.panels.left');

  @provide
  CommentsView(this._contextService);

  @override
  Element get component {
    if (_element == null) {
      _textArea = TextAreaElement()
        ..style.width = '95%'
        ..style.height = '100px';

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
}
