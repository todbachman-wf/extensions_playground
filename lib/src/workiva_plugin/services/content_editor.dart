import 'dart:html';

abstract class ContentEditor {
  String get identifier;
  Element get component;
  // eventually we'll need a selection api getter...
}

abstract class ContentEditorFactory<T extends ContentEditor> {
  String get contentType;
  T create();
}
