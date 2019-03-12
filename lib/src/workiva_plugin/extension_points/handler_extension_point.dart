import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/handler.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class HandlerExtensionPoint extends WorkivaExtensionPoint<Handler> {
  @provide
  HandlerExtensionPoint(Plugin plugin)
      : super(plugin, handlersExtensionPointId);
}
