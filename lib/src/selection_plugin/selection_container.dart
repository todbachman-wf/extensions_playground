import 'package:extensions_playground/src/selection_plugin/commands/selection_commands.dart';
import 'package:extensions_playground/src/selection_plugin/selection_commands_module.dart';
import 'package:extensions_playground/src/selection_plugin/selection_module.dart';
import 'package:extensions_playground/src/selection_plugin/services/selection_service.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'selection_container.inject.dart' as generated;

@Injector(
    const [PlatformServicesModule, SelectionCommandsModule, SelectionModule])
abstract class Selection {
  static Future<Selection> create(
      PlatformServicesModule platformServicesModule,
      SelectionCommandsModule selectionCommandsModule,
      SelectionModule selectionModule) async {
    var selection = await generated.Selection$Injector.create(
        platformServicesModule, selectionCommandsModule, selectionModule);

    selectionService = selection.getSelectionService();

    return selection;
  }

  @provide
  @boldCommand
  SelectionCommand getBoldCommand();

  @provide
  @italicCommand
  SelectionCommand getItalicCommand();

  @provide
  @commandsExtensionPointId
  String getCommandsExtensionPointId();

  @provide
  @singleton
  SelectionService getSelectionService();
}
