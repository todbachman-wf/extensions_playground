import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/comments_plugin/handlers/bold_handler.dart';
import 'package:extensions_playground/src/comments_plugin/handlers/italic_handler.dart';
import 'package:extensions_playground/src/comments_plugin/providers/comments_selection_provider.dart';
import 'package:extensions_playground/src/comments_plugin/views/comments_view.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

@module
class CommentsModule {
  @provide
  @singleton
  CommentsSelectionProvider provideSelectionProvider() =>
      new CommentsSelectionProvider();

  @provide
  @singleton
  BoldHandler provideBoldHandler(CommentsSelectionProvider selectionProvider,
          @boldCommandId String commandId) =>
      new BoldHandler(commandId, selectionProvider);

  @provide
  @singleton
  ItalicHandler provideItalicHandler(
          CommentsSelectionProvider selectionProvider,
          @italicCommandId String commandId) =>
      new ItalicHandler(commandId, selectionProvider);

  @provide
  @singleton
  CommentsView provideCommentsView(CommentsSelectionProvider selectionProvider,
          ContextService contextService) =>
      new CommentsView(selectionProvider, contextService);
}
