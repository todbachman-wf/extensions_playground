import 'package:extensions_playground/src/workiva_plugin/constants.dart'
    as constants;
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/content_editor_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view_service.dart';
import 'package:inject/inject.dart';

const workivaPluginId = const Qualifier(#workivaPluginId);
const commandExtensionPointId = const Qualifier(#commandExtensionPointId);
const contentEditorFactoryExtensionPointId =
    const Qualifier(#contentEditorFactoryExtensionPointId);
const contextExtensionPointId = const Qualifier(#contextExtensionPointId);
const handlerExtensionPointId = const Qualifier(#handlerExtensionPointId);
const menuExtensionPointId = const Qualifier(#menuExtensionPointId);
const viewExtensionPointId = const Qualifier(#viewExtensionPointId);

@module
class PlatformServicesModule {
  @provide
  @workivaPluginId
  String provideWorkivaPluginId() => constants.workivaPluginId;

  @provide
  @commandExtensionPointId
  String provideCommandExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.commandExtensionPointId}';

  @provide
  @contentEditorFactoryExtensionPointId
  String provideContentEditorFactoryExtensionPointId(
          @workivaPluginId String pluginId) =>
      '$pluginId.${constants.contentEditorFactoryExtensionPointId}';

  @provide
  @contextExtensionPointId
  String provideContextExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.contextExtensionPointId}';

  @provide
  @handlerExtensionPointId
  String provideHandlerExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.handlerExtensionPointId}';

  @provide
  @menuExtensionPointId
  String provideMenuExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.menuExtensionPointId}';

  @provide
  @viewExtensionPointId
  String provideViewExtensionPointId(@workivaPluginId String pluginId) =>
      '$pluginId.${constants.viewExtensionPointId}';

  @provide
  CommandService provideCommandService() => commandService;

  @provide
  ContentEditorService provideContentEditorService() => contentEditorService;

  @provide
  ContextService provideContextService() => contextService;

  @provide
  HandlerService provideHandlerService() => handlerService;

  @provide
  MenuService provideMenuService() => menuService;

  @provide
  ViewService provideViewService() => viewService;
}
