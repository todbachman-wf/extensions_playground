import 'dart:html' hide Platform;

import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class CreateDocumentButton implements Menu {
  final String _commandId;
  ButtonElement _element;
  HandlerService _handlerService;
  final Uri _location = Uri.parse('menu://workiva.rich.toolbars.edit');

  @provide
  CreateDocumentButton(this._handlerService, @createDocumentCommandId this._commandId);

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

  String _getButtonText() => 'Create Document';
}
