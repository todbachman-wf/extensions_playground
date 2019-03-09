import 'package:extensions_playground/src/workiva_plugin/extension_points/command_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/handler_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_module.dart';
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:inject/inject.dart';

import 'platform_container.inject.dart' as generated;

@Injector(const [PlatformModule])
abstract class Platform {
  static Future<Platform> create(PlatformModule platformModule) async {
    var platform = await generated.Platform$Injector.create(platformModule);

    // Initialize the singleton services.
    commandService = platform.getCommandService();
    handlerService = platform.getHandlerService();
    menuService = platform.getMenuService();

    return platform;
  }

  @provide
  CommandExtensionPoint getCommandExtensionPoint();

  @provide
  HandlerExtensionPoint getHandlerExtensionPoint();

  @provide
  MenuExtensionPoint getMenuExtensionPoint();

  @provide
  CommandService getCommandService();

  @provide
  HandlerService getHandlerService();

  @provide
  MenuService getMenuService();
}
