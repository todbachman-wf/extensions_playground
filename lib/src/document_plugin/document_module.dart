import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/document_plugin/handlers/bold_handler.dart';
import 'package:extensions_playground/src/document_plugin/handlers/italic_handler.dart';
import 'package:extensions_playground/src/document_plugin/providers/document_selection_provider.dart';
import 'package:extensions_playground/src/document_plugin/views/document_view.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

@module
class DocumentModule {
  @provide
  @singleton
  DocumentSelectionProvider provideSelectionProvider() =>
      new DocumentSelectionProvider();

  @provide
  @singleton
  BoldHandler provideBoldHandler(DocumentSelectionProvider selectionProvider,
          @boldCommandId String commandId) =>
      new BoldHandler(selectionProvider, commandId);

  @provide
  @singleton
  ItalicHandler provideItalicHandler(
          DocumentSelectionProvider selectionProvider,
          @italicCommandId String commandId) =>
      new ItalicHandler(selectionProvider, commandId);

  @provide
  @singleton
  DocumentView provideDocumentView(DocumentSelectionProvider selectionProvider,
          ContextService contextService) =>
      new DocumentView(selectionProvider, contextService);
}
