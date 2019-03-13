import 'package:extensions_playground/src/selection_plugin/commands/selection_commands.dart';
import 'package:extensions_playground/src/selection_plugin/extension_points/selection_provider_extension_point.dart';
import 'package:extensions_playground/src/selection_plugin/services/selection_service.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

@module
class SelectionModule {
  final Plugin _plugin;

  SelectionModule(this._plugin);

  @provide
  Plugin providePlugin() => _plugin;

  @provide
  @singleton
  SelectionProviderExtensionPoint provideSelectionProviderExtensionPoint(
          Plugin plugin) =>
      new SelectionProviderExtensionPoint(plugin);

  @provide
  @singleton
  SelectionService provideSelectionService(
          SelectionProviderExtensionPoint extensionPoint,
          ContextService service) =>
      new SelectionServiceImpl(extensionPoint, service);

  @provide
  @boldCommand
  SelectionCommand provideBoldCommand(@boldCommandId String commandId) =>
      new SelectionCommand(commandId);

  @provide
  @italicCommand
  SelectionCommand provideItalicCommand(@italicCommandId String commandId) =>
      new SelectionCommand(commandId);
}
