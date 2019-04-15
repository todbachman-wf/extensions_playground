import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class CreateDocumentHandler implements Handler {
  final String _commandId;
  final ContentEditorService _editorService;

  @provide
  CreateDocumentHandler(@createDocumentCommandId this._commandId, this._editorService);

  @override
  String get commandId => _commandId;

  @override
  String get contextId => 'appRoot';

  @override
  void execute() {
    _editorService.createRandomEditor();
  }
}
