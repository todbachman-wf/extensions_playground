import 'dart:html';

import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class CommentsView implements View {
  Element _element;
  TextAreaElement _textArea;
  InputElement _checkbox;
  final Uri _location = Uri.parse('view://workiva.rich.panels.left');

  @provide
  CommentsView();

  @override
  Element get component {
    if (_element == null) {
      _textArea = TextAreaElement();
      _checkbox = InputElement()..type = 'checkbox';
      _element = DivElement()
        ..append(DivElement()..text = 'Comments:')
        ..append(_textArea)
        ..append(_checkbox);
    }
    return _element;
  }

  @override
  Uri get location => _location;
}
