import 'dart:html' hide Platform;

import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu.dart';
import 'package:inject/inject.dart';

class BoldButton implements Menu {
  final String _commandId;
  ButtonElement _element;
  final FormattingService _formattingService;
  final HandlerService _handlerService;
  final Uri _location = Uri.parse('menu://workiva.rich.toolbars.edit');

  @provide
  BoldButton(this._formattingService, this._handlerService,
      @boldCommandId this._commandId) {
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

  @override
  Uri get location => _location;

  void _handleButtonClick(MouseEvent _) =>
      _handlerService.executeCommand(_commandId);

  void _handleFormattingDidChange(Null _) {
    if (_element == null) return;

    _element.text = _getButtonText();
  }

  String _getButtonText() => _formattingService.isBold ? '*bold*' : 'bold';
}
