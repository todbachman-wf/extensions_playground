import 'dart:html' hide Platform;

import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu.dart';
import 'package:inject/inject.dart';

class ItalicButton implements Menu {
  final String _commandId;
  ButtonElement _element;
  FormattingService _formattingService;
  HandlerService _handlerService;

  @provide
  ItalicButton(this._formattingService, this._handlerService,
      @italicCommandId this._commandId) {
    _formattingService.didChange.listen(_handleFormattingDidChange);
  }

  @override
  Element get component {
    if (_element == null) {
      _element = new ButtonElement()
        ..text = _getButtonText()
        ..onClick.listen(_handleButtonClick);
    }
    return _element;
  }

  void _handleButtonClick(MouseEvent _) =>
      _handlerService.executeCommand(_commandId);

  void _handleFormattingDidChange(Null _) {
    if (_element == null) return;

    _element.text = _getButtonText();
  }

  String _getButtonText() =>
      _formattingService.isItalic ? '~italic~' : 'italic';
}
