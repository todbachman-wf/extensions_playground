import 'dart:async';

import 'package:extensions_playground/selection_plugin.dart';
import 'package:inject/inject.dart';

class CommentsSelectionProvider implements SelectionProvider {
  bool _isBold = false;
  bool _isItalic = false;
  StreamController<Null> _didChangeController =
      new StreamController<Null>.broadcast();

  @provide
  CommentsSelectionProvider();

  @override
  String get contextId => 'comments';

  @override
  Stream<Null> get didChange => _didChangeController.stream;

  @override
  bool get isBold => _isBold;

  set isBold(bool value) {
    if (value == _isBold) return;

    _isBold = value;
    _didChangeController.add(null);
  }

  @override
  bool get isItalic => _isItalic;

  set isItalic(bool value) {
    if (value == _isItalic) return;

    _isItalic = value;
    _didChangeController.add(null);
  }
}
