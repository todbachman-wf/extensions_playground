import 'package:extensions_playground/src/workiva_plugin/constants.dart'
    as constants;
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:inject/inject.dart';

const workivaPluginId = const Qualifier(#workivaPluginId);
const commandsExtensionPointId = const Qualifier(#commandsExtensionPointId);
const handlersExtensionPointId = const Qualifier(#handlersExtensionPointId);
const menusExtensionPointId = const Qualifier(#menusExtensionPointId);

@module
class PlatformServicesModule {
  @provide
  @workivaPluginId
  String provideWorkivaPluginId() => constants.workivaPluginId;

  @provide
  @commandsExtensionPointId
  String provideCommandsExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.commandsExtensionPointId}';

  @provide
  @handlersExtensionPointId
  String provideHandlersExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.handlersExtensionPointId}';

  @provide
  @menusExtensionPointId
  String provideMenusExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.menusExtensionPointId}';

  @provide
  CommandService provideCommandService() => commandService;

  @provide
  HandlerService provideHandlerService() => handlerService;

  @provide
  MenuService provideMenuService() => menuService;
}
