import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/edit_toolbar_plugin/edit_toolbar_container.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/plugin.dart';

class EditToolbarPlugin extends Plugin {
  EditToolbar _container;

  @override
  String get uniqueIdentifier => 'edit_toolbar';

  Future<Null> init() async {
    _container = await EditToolbar.create(
        new PlatformServicesModule(), new SelectionCommandsModule(), new PlatformCommandsModule());
  }

  @override
  void registerExtensions(RegisterExtension register) {
    register(_container.getMenusExtensionPointId(), _container.getBoldButton());
    register(
        _container.getMenusExtensionPointId(), _container.getItalicButton());
    register(_container.getMenusExtensionPointId(), _container.getCreateDocumentButton());
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {}
}
