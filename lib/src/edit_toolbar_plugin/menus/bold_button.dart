import 'dart:html' hide Platform;

import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class BoldButton implements Menu {
  final String _commandId;
  ButtonElement _element;
  final SelectionService _selectionService;
  final HandlerService _handlerService;
  final Uri _location = Uri.parse('menu://workiva.rich.toolbars.edit');

  @provide
  BoldButton(this._selectionService, this._handlerService,
      @boldCommandId this._commandId) {
    _selectionService.didChange.listen(_handleSelectionDidChange);
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

  void _handleSelectionDidChange(Null _) {
    if (_element == null) return;

    _element.text = _getButtonText();
  }

  String _getButtonText() => _selectionService.isBold ? '*bold*' : 'bold';
}
