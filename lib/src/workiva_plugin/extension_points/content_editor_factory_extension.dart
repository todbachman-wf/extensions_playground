import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/extension_points/workiva_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/content_editor.dart';
import 'package:inject/inject.dart';
import 'package:plugin/plugin.dart';

class ContentEditorFactoryExtensionPoint
    extends WorkivaExtensionPoint<ContentEditorFactory> {
  @provide
  ContentEditorFactoryExtensionPoint(Plugin plugin)
      : super(plugin, contentEditorFactoryExtensionPointId);
}
