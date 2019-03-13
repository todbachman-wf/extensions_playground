import 'dart:html' hide Platform;

import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class FormattingView implements View {
  DivElement _element;
  final Uri _location = Uri.parse('view://workiva.rich.panels.right');
  String _docText = '''
  Call me Ishmael. Some years ago—never mind how long precisely—having little or 
  no money in my purse, and nothing particular to interest me on shore, I thought 
  I would sail about a little and see the watery part of the world. It is a way 
  I have of driving off the spleen and regulating the circulation. Whenever I 
  find myself growing grim about the mouth; whenever it is a damp, drizzly 
  November in my soul; whenever I find myself involuntarily pausing before 
  coffin warehouses, and bringing up the rear of every funeral I meet; and 
  especially whenever my hypos get such an upper hand of me, that it requires a 
  strong moral principle to prevent me from deliberately stepping into the street, 
  and methodically knocking people’s hats off—then, I account it high time to get 
  to sea as soon as I can. This is my substitute for pistol and ball. With a 
  philosophical flourish Cato throws himself upon his sword; I quietly take to 
  the ship. There is nothing surprising in this. If they but knew it, almost all 
  men in their degree, some time or other, cherish very nearly the same feelings 
  towards the ocean with me.
  ''';

  final SelectionService _selectionService;

  @provide
  FormattingView(this._selectionService) {
    _selectionService.didChange.listen(_handleFormattingDidChange);
  }

  @override
  Element get component {
    if (_element == null) {
      _element = new DivElement()
        ..style.fontWeight = _getFontWeight()
        ..style.fontStyle = _getFontStyle()
        ..text = _docText;
    }
    return _element;
  }

  @override
  Uri get location => _location;

  void _handleFormattingDidChange(Null _) {
    if (_element == null) return;

    _element.style
      ..fontWeight = _getFontWeight()
      ..fontStyle = _getFontStyle();
  }

  String _getFontWeight() => _selectionService.isBold ? 'bold' : 'normal';

  String _getFontStyle() => _selectionService.isItalic ? 'italic' : 'normal';
}
