import 'package:extensions_playground/src/selection_plugin/commands/selection_commands.dart';
import 'package:extensions_playground/src/selection_plugin/constants.dart';
import 'package:extensions_playground/src/selection_plugin/services/selection_service.dart';
import 'package:inject/inject.dart';

@module
class SelectionCommandsModule {
  @provide
  @boldCommandId
  String provideBoldCommandId() => '$selectionPluginId.bold';

  @provide
  @italicCommandId
  String provideItalicCommandId() => '$selectionPluginId.italic';

  @provide
  SelectionService provideSelectionService() => selectionService;
}
