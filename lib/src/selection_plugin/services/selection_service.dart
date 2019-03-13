import 'dart:async';

SelectionService selectionService;

abstract class SelectionService {
  bool isBold;
  bool isItalic;
  Stream<Null> get didChange;
}

class SelectionServiceImpl implements SelectionService {
  bool _isBold = false;
  bool _isItalic = false;
  StreamController<Null> _didChangeController =
      new StreamController<Null>.broadcast();

  Stream<Null> get didChange => _didChangeController.stream;

  @override
  bool get isBold => _isBold;

  @override
  set isBold(bool value) {
    if (value == _isBold) return;

    _isBold = value;
    _didChangeController.add(null);
  }

  @override
  bool get isItalic => _isItalic;

  @override
  set isItalic(bool value) {
    if (value == _isItalic) return;

    _isItalic = value;
    _didChangeController.add(null);
  }
}
