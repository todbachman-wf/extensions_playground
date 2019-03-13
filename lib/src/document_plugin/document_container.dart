import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/document_plugin/document_module.dart';
import 'package:extensions_playground/src/document_plugin/handlers/bold_handler.dart';
import 'package:extensions_playground/src/document_plugin/handlers/italic_handler.dart';
import 'package:extensions_playground/src/document_plugin/providers/document_selection_provider.dart';
import 'package:extensions_playground/src/document_plugin/views/document_view.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'document_container.inject.dart' as generated;

@Injector(
    const [PlatformServicesModule, SelectionCommandsModule, DocumentModule])
abstract class Document {
  static final create = generated.Document$Injector.create;

  @provide
  BoldHandler getBoldHandler();

  @provide
  ItalicHandler getItalicHandler();

  @provide
  DocumentView getDocumentView();

  @provide
  @contextExtensionPointId
  String getContextExtensionPointId();

  @provide
  @handlerExtensionPointId
  String getHandlersExtensionPointId();

  @provide
  @viewExtensionPointId
  String getViewsExtensionPointId();

  @provide
  DocumentSelectionProvider getSelectionProvider();
}
