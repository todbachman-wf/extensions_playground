import 'package:extensions_playground/src/workiva_plugin/extension_points/command_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/content_editor_factory_extension.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/context_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/handler_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/menu_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/view_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/command_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/content_editor_service.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context_service.dart';
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
  Plugin providePlugin() => _plugin;

  @provide
  @singleton
  CommandExtensionPoint provideCommandExtensionPoint(Plugin plugin) =>
      new CommandExtensionPoint(plugin);

  @provide
  @singleton
  ContentEditorFactoryExtensionPoint provideContentEditorFactoryExtensionPoint(
          Plugin plugin) =>
      new ContentEditorFactoryExtensionPoint(plugin);

  @provide
  @singleton
  ContextExtensionPoint provideContextExtensionPoint(Plugin plugin) =>
      new ContextExtensionPoint(plugin);

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
  CommandService provideCommandService(CommandExtensionPoint extensionPoint) =>
      new CommandServiceImpl(extensionPoint);

  @provide
  @singleton
  ContentEditorService provideContentEditorService(
          ContentEditorFactoryExtensionPoint extensionPoint) =>
      new ContentEditorServiceImpl(extensionPoint);

  @provide
  @singleton
  ContextService provideContextService(ContextExtensionPoint extensionPoint) =>
      new ContextServiceImpl(extensionPoint);

  @provide
  @singleton
  HandlerService provideHandlerService(
          CommandService commandService,
          ContextService contextService,
          HandlerExtensionPoint extensionPoint) =>
      new HandlerServiceImpl(commandService, contextService, extensionPoint);

  @provide
  @singleton
  MenuService provideMenuService(MenuExtensionPoint extensionPoint) =>
      new MenuServiceImpl(extensionPoint);

  @provide
  @singleton
  ViewService provideViewService(ViewExtensionPoint extensionPoint) =>
      new ViewServiceImpl(extensionPoint);
}
