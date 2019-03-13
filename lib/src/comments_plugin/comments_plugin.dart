import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/comments_plugin/comments_container.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/plugin.dart';

class CommentsPlugin extends Plugin {
  Comments _container;

  @override
  String get uniqueIdentifier => 'document';

  Future<Null> init() async {
    _container = await Comments.create(
        new PlatformServicesModule(), new SelectionCommandsModule());
  }

  @override
  void registerExtensions(RegisterExtension register) {
    // contexts
    register(_container.getContextExtensionPointId(),
        new AbstractContext('comments'));

    // handlers
    register(
        _container.getHandlersExtensionPointId(), _container.getBoldHandler());
    register(_container.getHandlersExtensionPointId(),
        _container.getItalicHandler());

    // views
    register(
        _container.getViewsExtensionPointId(), _container.getCommentsView());
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {}
}
