import 'dart:async';

import 'package:extensions_playground/src/workiva_plugin/extension_points/content_editor_factory_extension.dart';
import 'package:extensions_playground/src/workiva_plugin/services/content_editor.dart';
import 'package:inject/inject.dart';

ContentEditorService contentEditorService;


abstract class ContentEditorService {
  ContentEditor get activeContentEditor;
  Iterable<ContentEditor> get contentEditors;
  Stream<ContentEditor> get didCreateContentEditor;
  void createRandomEditor();
}

class ContentEditorServiceImpl implements ContentEditorService {
  final ContentEditorFactoryExtensionPoint _factories;
  List<ContentEditor> _editors = [];
  ContentEditor _activeEditor;
  StreamController<ContentEditor> _didCreateContentEditor = new StreamController.broadcast();

  @provide
  ContentEditorServiceImpl(this._factories);

  @override
  ContentEditor get activeContentEditor => _activeEditor;

  @override
  Iterable<ContentEditor> get contentEditors => _editors;

  @override
  Stream<ContentEditor> get didCreateContentEditor => _didCreateContentEditor.stream;

  @override
  void createRandomEditor() {
    _activeEditor = _factories.extensionPoint.extensions.first.create();
    _editors.add(_activeEditor);
    _didCreateContentEditor.add(_activeEditor);
  }
}
