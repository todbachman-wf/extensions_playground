import 'package:extensions_playground/src/selection_plugin/commands/selection_commands.dart';
import 'package:extensions_playground/src/selection_plugin/services/selection_service.dart';
import 'package:inject/inject.dart';

@module
class SelectionModule {
  @provide
  @singleton
  SelectionService provideSelectionService() => new SelectionServiceImpl();

  @provide
  @boldCommand
  SelectionCommand provideBoldCommand(@boldCommandId String commandId) =>
      new SelectionCommand(commandId);

  @provide
  @italicCommand
  SelectionCommand provideItalicCommand(@italicCommandId String commandId) =>
      new SelectionCommand(commandId);
}
