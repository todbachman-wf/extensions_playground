import 'package:extensions_playground/src/workiva_plugin/extension_points/command_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/handler_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/view_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view_service.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

@module
class PlatformModule {
  final Plugin _plugin;

  PlatformModule(this._plugin);

  @provide
  @singleton
  Plugin providePlugin() => _plugin;

  @provide
  @singleton
  CommandExtensionPoint provideCommandExtensionPoint(Plugin plugin) =>
      new CommandExtensionPoint(plugin);

  @provide
  @singleton
  HandlerExtensionPoint provideHandlerExtensionPoint(Plugin plugin) =>
      new HandlerExtensionPoint(plugin);

  @provide
  @singleton
  MenuExtensionPoint provideMenuExtensionPoint(Plugin plugin) =>
      new MenuExtensionPoint(plugin);

  @provide
  @singleton
  ViewExtensionPoint provideViewExtensionPoint(Plugin plugin) =>
      new ViewExtensionPoint(plugin);

  @provide
  @singleton
  CommandService provideCommandService(CommandExtensionPoint commands) =>
      new CommandServiceImpl(commands);

  @provide
  @singleton
  HandlerService provideHandlerService(
          CommandService commandService, HandlerExtensionPoint handlers) =>
      new HandlerServiceImpl(commandService, handlers);

  @provide
  @singleton
  MenuService provideMenuService(MenuExtensionPoint menus) =>
      new MenuServiceImpl(menus);

  @provide
  @singleton
  ViewService provideViewService(ViewExtensionPoint views) =>
      new ViewServiceImpl(views);
}
