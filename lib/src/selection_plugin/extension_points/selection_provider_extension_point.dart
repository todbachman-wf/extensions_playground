import 'package:extensions_playground/src/selection_plugin/constants.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/plugin.dart';

abstract class SelectionProvider {
  String get contextId;
  Stream<Null> get didChange;
  bool get isBold;
  bool get isItalic;
}

class SelectionProviderExtensionPoint
    extends WorkivaExtensionPoint<SelectionProvider> {
  SelectionProviderExtensionPoint(Plugin plugin)
      : super(plugin, selectionProviderExtensionPointId);
}
