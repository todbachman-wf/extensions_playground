import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/document_plugin/document_container.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/plugin.dart';

class DocumentPlugin extends Plugin {
  Document _container;

  @override
  String get uniqueIdentifier => 'document';

  Future<Null> init() async {
    _container = await Document.create(
        new PlatformServicesModule(), new SelectionCommandsModule());
  }

  @override
  void registerExtensions(RegisterExtension register) {
    // handlers
    register(
        _container.getHandlersExtensionPointId(), _container.getBoldHandler());
    register(_container.getHandlersExtensionPointId(),
        _container.getItalicHandler());

    // views
    register(
        _container.getViewsExtensionPointId(), _container.getFormattingView());
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {}
}
