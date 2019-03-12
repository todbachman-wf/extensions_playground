import 'dart:html' hide Platform;

import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view.dart';
import 'package:inject/inject.dart';

class FormattingView implements View {
  DivElement _element;
  SpanElement _boldElement;
  SpanElement _italicElement;

  final FormattingService _formattingService;

  @provide
  FormattingView(this._formattingService) {
    _formattingService.didChange.listen(_handleFormattingDidChange);
  }

  @override
  Element get component {
    if (_element == null) {
      _boldElement = new SpanElement()..text = _getBoldText();
      _italicElement = new SpanElement()..text = _getItalicText();
      _element = new DivElement()..append(_boldElement)..append(new BRElement())..append(_italicElement);
    }
    return _element;
  }

  void _handleFormattingDidChange(Null _) {
    if (_element == null) return;

    _boldElement.text = _getBoldText();
    _italicElement.text = _getItalicText();
  }

  String _getBoldText() => 'Bold: ${_formattingService.isBold}';

  String _getItalicText() => 'Italic: ${_formattingService.isItalic}';
}
