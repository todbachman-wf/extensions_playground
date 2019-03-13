import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/view.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class ViewExtensionPoint extends WorkivaExtensionPoint<View> {
  @provide
  ViewExtensionPoint(Plugin plugin) : super(plugin, viewExtensionPointId);
}
