import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class ContextExtensionPoint extends WorkivaExtensionPoint<Context> {
  @provide
  ContextExtensionPoint(Plugin plugin) : super(plugin, contextExtensionPointId);
}
