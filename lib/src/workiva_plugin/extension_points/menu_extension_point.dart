import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/menu_service.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class MenuExtensionPoint extends WorkivaExtensionPoint<Menu> {
  @provide
  MenuExtensionPoint(Plugin plugin) : super(plugin, menusExtensionPointId);
}
