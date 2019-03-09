import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/constants.dart';
import 'package:extensions_playground/src/formatting_plugin/services/formatting_service.dart';
import 'package:inject/inject.dart';

@module
class FormattingModule {
  @provide
  @boldCommandId
  String provideBoldCommandId() => '$formattingPluginId.bold';

  @provide
  @italicCommandId
  String provideItalicCommandId() => '$formattingPluginId.italic';

  @provide
  @singleton
  FormattingService provideFormattingService() => new FormattingServiceImpl();

  @provide
  @boldCommand
  FormattingCommand provideBoldCommand(@boldCommandId String commandId) =>
      new FormattingCommand(commandId);

  @provide
  @italicCommand
  FormattingCommand provideItalicCommand(@italicCommandId String commandId) =>
      new FormattingCommand(commandId);
}
