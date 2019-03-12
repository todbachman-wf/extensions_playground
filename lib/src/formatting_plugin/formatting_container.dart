import 'package:extensions_playground/src/formatting_plugin/commands/formatting_command.dart';
import 'package:extensions_playground/src/formatting_plugin/formatting_module.dart';
import 'package:extensions_playground/src/formatting_plugin/handlers/bold_handler.dart';
import 'package:extensions_playground/src/formatting_plugin/handlers/italic_handler.dart';
import 'package:extensions_playground/src/formatting_plugin/menus/bold_button.dart';
import 'package:extensions_playground/src/formatting_plugin/menus/italic_button.dart';
import 'package:extensions_playground/src/formatting_plugin/views/formatting_view.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_services_module.dart';
import 'package:inject/inject.dart';

import 'formatting_container.inject.dart' as generated;

@Injector(const [PlatformServicesModule, FormattingModule])
abstract class Formatting {
  static final create = generated.Formatting$Injector.create;

  @provide
  BoldButton getBoldButton();

  @provide
  @boldCommand
  FormattingCommand getBoldCommand();

  @provide
  BoldHandler getBoldHandler();

  @provide
  ItalicButton getItalicButton();

  @provide
  @italicCommand
  FormattingCommand getItalicCommand();

  @provide
  ItalicHandler getItalicHandler();

  @provide
  FormattingView getFormattingView();

  @provide
  @commandsExtensionPointId
  String getCommandsExtensionPointId();

  @provide
  @handlersExtensionPointId
  String getHandlersExtensionPointId();

  @provide
  @menusExtensionPointId
  String getMenusExtensionPointId();

  @provide
  @viewsExtensionPointId
  String getViewsExtensionPointId();
}
