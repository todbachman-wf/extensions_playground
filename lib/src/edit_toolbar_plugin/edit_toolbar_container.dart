import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/edit_toolbar_plugin/menus/bold_button.dart';
import 'package:extensions_playground/src/edit_toolbar_plugin/menus/create_document_button.dart';
import 'package:extensions_playground/src/edit_toolbar_plugin/menus/italic_button.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'edit_toolbar_container.inject.dart' as generated;

@Injector(const [PlatformServicesModule, SelectionCommandsModule, PlatformCommandsModule])
abstract class EditToolbar {
  static final create = generated.EditToolbar$Injector.create;

  @provide
  BoldButton getBoldButton();

  @provide
  ItalicButton getItalicButton();

  @provide
  CreateDocumentButton getCreateDocumentButton();

  @provide
  @menuExtensionPointId
  String getMenusExtensionPointId();
}
