import 'package:extensions_playground/src/workiva_plugin/extension_points/command_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/content_editor_factory_extension.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/context_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/handler_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/view_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/handlers/create_document_handler.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_module.dart';
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/content_editor_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view_service.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'platform_container.inject.dart' as generated;

@Injector(const [PlatformModule, PlatformCommandsModule])
abstract class Platform {
  static Future<Platform> create(PlatformModule platformModule, PlatformCommandsModule platformCommandsModule) async {
    var platform = await generated.Platform$Injector.create(platformModule, platformCommandsModule);

    // Initialize the singleton services.
    commandService = platform.getCommandService();
    contentEditorService = platform.getContentEditorService();
    contextService = platform.getContextService();
    handlerService = platform.getHandlerService();
    menuService = platform.getMenuService();
    viewService = platform.getViewService();

    return platform;
  }

  @provide
  CommandExtensionPoint getCommandExtensionPoint();

  @provide
  ContentEditorFactoryExtensionPoint getContentEditorFactoryExtensionPoint();

  @provide
  ContextExtensionPoint getContextExtensionPoint();

  @provide
  HandlerExtensionPoint getHandlerExtensionPoint();

  @provide
  MenuExtensionPoint getMenuExtensionPoint();

  @provide
  ViewExtensionPoint getViewExtensionPoint();

  @provide
  CommandService getCommandService();

  @provide
  ContentEditorService getContentEditorService();

  @provide
  ContextService getContextService();

  @provide
  HandlerService getHandlerService();

  @provide
  MenuService getMenuService();

  @provide
  ViewService getViewService();

  @provide
  CreateDocumentHandler getCreateDocumentHandler();
}
